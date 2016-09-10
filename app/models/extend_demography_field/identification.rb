class Identification < ApplicationRecord
  validates_presence_of :identification_number, :identification_type_id
  validates_uniqueness_of :identification_type_id, scope: [:extend_demography_id]

  def self.safe_attributes
    [:id, :identification_number, :status, :date_expired, :issued_by, :note, :identification_type_id, :_destroy]
  end

  def to_html
    output = "<div class='col-xs-12'>"
    output<< "<div class='col-xs-2'>#{identification_type} </div>"
    output<< "<div class='col-xs-2'>#{identification_number} </div>"
    output<< "<div class='col-xs-2'>#{status} </div>"
    output<< "<div class='col-xs-2'>#{date_expired} </div>"
    output<< "<div class='col-xs-2'>#{issued_by} </div>"
    output<< "</div>"
    output.html_safe
  end

end
