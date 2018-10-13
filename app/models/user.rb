class User < ApplicationRecord # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    has_many :enrollments, :foreign_key => :student_id, :primary_key => :id
    has_many :subjects, through: :enrollments, :foreign_key => :student_id, :primary_key => :id
    has_many :books, through: :enrollments, :foreign_key => :student_id, :primary_key => :id
    has_many :book_visit_logs
    has_many :notes
    has_many :grades, :foreign_key => :student_id, :primary_key => :id

    def teacher_subjects
        return Subject.where(teacher_id: self.id)
    end

    def teacher_books
        return Book.where(teacher_id: self.id)
    end

    def teacher_sections
        return Section.where(teacher_id: self.id)
    end

    def teacher_chapters
        return Chapter.where(teacher_id: self.id)
    end

    def create_user_code
        return random_string(10, alphabet + numbers)
        # TODO: make sure unique one gets entered each time, db check
    end

    private

    def random_string(length, charset)
      Array.new(length) { charset.sample }.join
    end
 
    def alphabet
      @alphabet ||= Array('A'..'Z') + Array('a'..'z')
    end

    def numbers
      @numbers ||= Array(0 .. 9)
    end

    # def already_enrolled?(book)
    #     return true if Enrollment.where(student_id: self.id, book_id: book.id).length > 0
    #     # return true if Enrollment.where(teacher_id: self.id, book_id: book.id).length > 0
    #     return false
    # end

end



