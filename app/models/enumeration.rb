class Enumeration < ActiveRecord::Base
  include SubclassFactory
  default_scope lambda {order(:position)}

  before_destroy :check_integrity
  before_save    :check_default

  # attr_protected :type

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:type]
  validates_length_of :name, :maximum => 30

  scope :sorted, lambda { order(:position) }
  scope :active, lambda { where(:active => true) }

  scope :named, lambda {|arg| where("LOWER(#{table_name}.name) = LOWER(?)", arg.to_s.strip)}

  def self.default
    # Creates a fake default scope so Enumeration.default will check
    # it's type.  STI subclasses will automatically add their own
    # types to the finder.
    if self.descends_from_active_record?
      where(:is_default => true, :type => 'Enumeration').first
    else
      # STI classes are
      where(:is_default => true).first
    end
  end

  # Overloaded on concrete classes
  def option_name
    nil
  end

  def check_default
    if is_default? && is_default_changed?
      Enumeration.where({:type => type}).update_all({:is_default => false})
    end
  end

  # Overloaded on concrete classes
  def objects_count
    0
  end

  def in_use?
    self.objects_count != 0
  end

  # Is this enumeration overriding a system level enumeration?
  def is_override?
    !self.parent.nil?
  end

  alias :destroy_without_reassign :destroy

  # Destroy the enumeration
  # If a enumeration is specified, objects are reassigned
  def destroy(reassign_to = nil)
    if reassign_to && reassign_to.is_a?(Enumeration)
      self.transfer_relations(reassign_to)
    end
    destroy_without_reassign
  end

  def <=>(enumeration)
    position <=> enumeration.position
  end

  def to_s; name end

  # Returns the Subclasses of Enumeration.  Each Subclass needs to be
  # required in development mode.
  #
  # Note: subclasses is protected in ActiveRecord
  def self.get_subclasses
    subclasses
  end

  # Does the +new+ Hash override the previous Enumeration?
  def self.overriding_change?(new, previous)
    if same_active_state?(new['active'], previous.active)
      return false
    else
      return true
    end
  end

  # Are the new and previous fields equal?
  def self.same_active_state?(new, previous)
    new = (new == "1" ? true : false)
    return new == previous
  end

  private

  def check_integrity
    raise "Cannot delete enumeration" if self.in_use?
  end

  # Overrides Redmine::Acts::Positioned#set_default_position so that enumeration overrides
  # get the same position as the overriden enumeration
  def set_default_position
    if position.nil? && parent
      self.position = parent.position
    end
    super
  end

  # Overrides Redmine::Acts::Positioned#update_position so that overrides get the same
  # position as the overriden enumeration
  def update_position
    super
    if position_changed?
      self.class.where.not(:parent_id => nil).update_all(
          "position = coalesce((
          select position
          from (select id, position from enumerations) as parent
          where parent_id = parent.id), 1)"
      )
    end
  end

  # Overrides Redmine::Acts::Positioned#remove_position so that enumeration overrides
  # get the same position as the overriden enumeration
  def remove_position
    if parent_id.blank?
      super
    end
  end
end

# Force load the subclasses in development mode
require_dependency 'address_type'
require_dependency 'affiliation_type'
require_dependency 'certification_type'
require_dependency 'clearence_type'
require_dependency 'citizenship_type'
require_dependency 'contact_type'
require_dependency 'country_type'
require_dependency 'department_type'
require_dependency 'document_type'
require_dependency 'education_type'
require_dependency 'email_type'
require_dependency 'employment_type'
require_dependency 'ethnicity_type'
require_dependency 'fax_type'
require_dependency 'gender_type'
require_dependency 'identification_type'
require_dependency 'location_type'
require_dependency 'language_type'
require_dependency 'organization_type'
require_dependency 'phone_type'
require_dependency 'proficiency_type'
require_dependency 'pay_rate_type'
require_dependency 'role_type'
require_dependency 'religion_type'
require_dependency 'state_type'
