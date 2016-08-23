class Email < ApplicationRecord
  belongs_to :email_type
  belongs_to :extend_demography
end
