class Box < ApplicationRecord
    belongs_to :lesson
    has_one :video
    has_one :pic
    has_one :powerpoint
    has_one :doc
    has_one :paragraph
    has_one :solve
    has_one :box
    has_one :note

end
