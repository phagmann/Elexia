class Lesson < ApplicationRecord
    belongs_to :subject
    belongs_to :book
    belongs_to :section
    belongs_to :chapter
    has_many :boxes
    has_many :assignments
end
