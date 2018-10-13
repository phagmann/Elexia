class Book < ApplicationRecord
    has_many :enrollments, :foreign_key => :subject_id, :primary_key => :id
    has_many :users, through: :enrollments, :foreign_key => :student_id, :primary_key => :id

    belongs_to :subject
    has_many :sections
    has_many :chapters
    has_many :lessons
    has_many :book_visit_logs
    has_many :grades
    has_many :assignments


    def already_enrolled?(user)
        return true if Book.where(teacher_id: user.id, id: self.id).length > 0
        return true if Enrollment.where(student_id: user.id, book_id: self.id).length > 0
        return false
    end
end
