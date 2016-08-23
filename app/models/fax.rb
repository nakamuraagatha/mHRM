class Fax < ApplicationRecord
  belongs_to :fax_type
  belongs_to :extend_demography
end
