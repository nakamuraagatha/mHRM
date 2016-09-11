class Email < ApplicationRecord
  belongs_to :email_type

  validates_presence_of :email_address, :email_type_id
  validates_uniqueness_of :email_address, scope: [:email_type_id, :extend_demography_id]
  validates_uniqueness_of :email_type_id, scope: [:extend_demography_id]


  def self.safe_attributes
    [:id, :email_type_id, :email_address, :note, :_destroy]
  end

  def to_html
    output = "<div class='col-xs-12'>"
    output<< "<div class='col-xs-2'>#{email_type} </div>"
    output<< "<div class='col-xs-8'>#{email_address} </div>"
    output<< "</div>"
    output
  end

  def to_pdf(pdf)
    pdf.text "Email type: #{email_type}. Email: #{email_address}"
  end

end
