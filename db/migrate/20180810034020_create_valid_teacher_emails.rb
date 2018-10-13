class CreateValidTeacherEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :valid_teacher_emails do |t|
      t.string :teacher_email
      t.string :sign_up_code
      t.timestamps
    end
  end
end
