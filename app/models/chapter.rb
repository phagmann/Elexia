class Chapter < ApplicationRecord
    belongs_to :subject
    belongs_to :book
    belongs_to :section
    has_many :lessons
end
