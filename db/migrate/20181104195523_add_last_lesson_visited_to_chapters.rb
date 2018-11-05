class AddLastLessonVisitedToChapters < ActiveRecord::Migration[5.1]
  def change
    add_column :chapters, :last_lesson_visited, :integer
  end
end
