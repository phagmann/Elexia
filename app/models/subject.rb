class Subject < ApplicationRecord
    has_many :enrollments, :foreign_key => :subject_id, :primary_key => :id
    has_many :users, through: :enrollments, :foreign_key => :student_id, :primary_key => :id
    
    has_many :books
    has_many :sections
    has_many :chapters
    has_many :lessons
    def teacher_books(user)
        return Book.where(teacher_id: user.id, subject_id: self.id)
    end

    
end
