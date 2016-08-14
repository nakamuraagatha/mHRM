class Education < ApplicationRecord
  belongs_to :user

  class EducationClearence
    TOP_SECRET  = 0
    SECRET      = 1
    PUBLIC_TRUST= 2
    NONE        = 3
    
    def self.select_options
      [['TOP SECRET'  , 0],
      ['SECRET'      , 1],
      ['PUBLIC TRUST', 2],
      ['NONE'        , 3]]
    end


    class EducationType
      ASSOCIATE       = 0
      BACHELOR         = 1
      MASTER          = 2
      DOCTORATE       = 3
      GRADUATE        = 4
    end

    Class Certification

    end

end
