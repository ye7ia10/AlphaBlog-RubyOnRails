class User < ApplicationRecord

    before_save {self.email = email.downcase}
    has_many :articles
    validates :username, presence: true ,
                         uniqueness: true, 
                         length: { minimum: 3 , maximum: 20}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :email, presence: true ,
                      uniqueness: {case_sensitive: false},
                      length: {maximum: 100},
                      format: {with: VALID_EMAIL_REGEX}

    has_secure_password validations: false



end