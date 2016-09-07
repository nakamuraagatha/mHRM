class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # HAS ONE
  has_one :core_demographic, :dependent => :destroy
  has_one :user_extend_demography, :dependent => :destroy
  has_one :job_detail

  # HAS MANY
  has_many :educations, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_many :organizations
  has_many :departments
  has_many :positions
  has_many :contacts

  validates_uniqueness_of :login, :email
  validates_presence_of :login, :email

  def self.visible
    if User.current.allowed_to?(:manage_roles)
      employees
    else
      where(id: User.current.id)
    end
  end

  def self.employees
    User.where(admin: false)
  end

  def self.current=(user)
    RequestStore.store[:current_user] = user
  end

  def self.current
    RequestStore.store[:current_user] ||= User.new
  end

  def extend_informations
    user_extend_demography || UserExtendDemography.new(user_id: self.id)
  end


  def allowed_to?(action)
    if action.is_a? Hash
      allowed_actions.include? "#{action[:controller]}/#{action[:action]}"
    else
      permissions.include? action.to_sym
    end
  end

  def has_same_department?(for_user)
    permitted_users.include?(for_user)
  end

  def permitted_users
    @permitted_users ||= begin
      if self.admin?
        User.where(nil)
      elsif !job_detail
        User.where(id: self.id)
      else
        job_detail.department.users
      end
    end
  end

  def all_permissions
    @allowed_permissions ||= begin
      RedCarpet::AccessControl.permissions.collect {|p| p.name}
    end
  end

  def allowed_actions
    @actions_allowed ||= permissions.inject([]) { |actions, permission| actions += RedCarpet::AccessControl.allowed_actions(permission) }.flatten
  end


  def job
    job_detail || JobDetail.new(user_id: self.id)
  end

  def name
    cd = core_demographic
    return login if cd.nil?
    "#{cd.first_name} #{cd.last_name}"
  end

  def profile
    @profile ||= begin
      core_demographic || CoreDemographic.new(user_id: self.id)
    end
  end

  def first_name;  profile.first_name;  end
  def middle_name; profile.middle_name; end
  def last_name;   profile.last_name;   end
  def birthday;    profile.birth_date;  end
  def gender;      profile.gender;      end
  def active?;     self.state ? 'Active' : 'Non active';         end



  def profile_image
    if avatar.thumb.url
      avatar.thumb.url
    else
      'male.png'
    end
  end

  def self.safe_attributes
    [:login, :state, :email]
  end

  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && account_active?
  end

  def account_active?; state?; end

  def to_s
    name
  end

  def permissions
    return all_permissions if self.admin?
    return [] unless job_detail
    job_detail.role.try( :permissions ) || []
  end

  mount_uploader :avatar, AvatarUploader
end
