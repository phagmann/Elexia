class Section < ApplicationRecord
    belongs_to :subject
    belongs_to :book
    has_many :chapters
    has_many :lessons

    
end
