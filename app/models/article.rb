class Article < ApplicationRecord
    belongs_to :user

    validates :title, presence: true ,
                      length: { minimum: 3 , maximum: 20}

    validates :desc, presence: true ,
                      length: {maximum: 200}
end
