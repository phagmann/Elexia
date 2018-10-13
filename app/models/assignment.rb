class Assignment < ApplicationRecord
    belongs_to :book
    belongs_to :lesson
    has_many :grades
end
