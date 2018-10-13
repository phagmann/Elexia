class Grade < ApplicationRecord
    belongs_to :user, :foreign_key => :student_id, :primary_key => :id
    belongs_to :assignment
     belongs_to :book


     def sum_grades_for_weight
        weight_grade = 0.0
        grades = Grade.where(student_id: self.student_id, book_id: self.book_id, grade_weight_index: self.grade_weight_index).select("grades.*, assignments.*").joins("INNER JOIN assignments ON assignments.id = grades.assignment_id").order('grade_weight_index, order_placement')
        return '' if grades.nil?
        last_grade_in_weight = grades.maximum("order_placement")
        return '' if last_grade_in_weight != self.order_placement
        total_grade_score = grades.sum("score_out_of_points").to_f
        total_score_possible = grades.sum("points").to_f
        weight_grade = 100.00*total_grade_score / total_score_possible
        return  weight_grade
     end

     def sum_grades_for_class
     end
end
