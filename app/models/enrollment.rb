class Enrollment < ApplicationRecord
    belongs_to :user, :foreign_key => :student_id, :primary_key => :id
    belongs_to :book, :foreign_key => :book_id, :primary_key => :id
    belongs_to :subject, :foreign_key => :subject_id, :primary_key => :id
 end
