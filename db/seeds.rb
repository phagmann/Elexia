# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Menu.create(hierarchy: "Dashboard", category: "Menus", title: "Main Menu", order_cato: 1 , order_title: 1, url_path: "../menus" )
Menu.create(hierarchy: "Students", category: "Tools", title: "Addition", order_cato: 1 , order_title: 1, url_path: "../addition" )
Menu.create(hierarchy: "Students", category: "Tools", title: "Subtraction", order_cato: 1 , order_title: 2, url_path: "../subtraction" )

# Menu.create(hierarchy: "Teachers", category: "Classes", title: "Enroll Students", order_cato: 2 , order_title: 1, url_path: "../enrollments" )

Menu.create(hierarchy: "Teachers", category: "Create", title: "Subject", order_cato: 1 , order_title: 1, url_path: "../subjects/new" )
Menu.create(hierarchy: "Teachers", category: "Create", title: "Book", order_cato: 1 , order_title: 2, url_path: "../books/new" )
Menu.create(hierarchy: "Teachers", category: "Create", title: "Section", order_cato: 1 , order_title: 3, url_path: "../sections/new" )
Menu.create(hierarchy: "Teachers", category: "Create", title: "Chapter", order_cato: 1 , order_title: 4, url_path: "../chapters/new" )
Menu.create(hierarchy: "Teachers", category: "Create", title: "Lesson", order_cato: 1 , order_title: 5, url_path: "../lessons/new" )

User.create(email: "t1@comp.com", first_name: "Patrick", last_name: "Smith" , user_code: "tys9KGgNKO", password: "testtest", password_confirmation: "testtest", is_teacher: true)
User.create(email: "s1@comp.com", first_name: "Carl", last_name: "Mills" , user_code: "ZJzlDwMaSs", password: "testtest", password_confirmation: "testtest", is_teacher: false)
User.create(email: "s2@comp.com", first_name: "Jacob", last_name: "Lopez" , user_code: "Q1xXAeGS30", password: "testtest", password_confirmation: "testtest", is_teacher: false)


Subject.create(teacher_id: 1, subject_name: "Math", subject_description: "The one with numbers!", url_path: nil)

Book.create(teacher_id: 1, subject_id: 1, book_name: "Intro to Arithmatic", book_description: "3rd grade level", url_path: '/books/1', book_weights_string_list: '80,20')



# Book.create(teacher_id: 1, subject_id: 1, book_name: "Advanced Arithmatic", book_description: "4th grade level", url_path: '/books/2')
# Book.create(teacher_id: 1, subject_id: 1, book_name: "Intro to Varibles", book_description: "5rd grade level", url_path: '/books/3')
# Book.create(teacher_id: 1, subject_id: 1, book_name: "Advanced Varibles", book_description: "6th grade level", url_path: '/books/4')

Enrollment.create(teacher_id: 1, student_id: 2, subject_id: 1, book_id: 1)
Enrollment.create(teacher_id: 1, student_id: 3, subject_id: 1, book_id: 1)
# Enrollment.create(teacher_id: 1, student_id: 2, subject_id: 1, book_id: 2)


Section.create(teacher_id: 1, subject_id: 1, book_id: 1, section_name: "Section 1", section_description: "Addition", url_path: nil)
# Section.create(teacher_id: 1, subject_id: 1, book_id: 1, section_name: "Section 2", section_description: "Subtraction", url_path: nil)
# Section.create(teacher_id: 1, subject_id: 1, book_id: 1, section_name: "Section 3", section_description: "Multibly", url_path: nil)

# Section.create(teacher_id: 1, subject_id: 1, book_id: 2, section_name: "Section 1", section_description: "Division", url_path: nil)
# Section.create(teacher_id: 1, subject_id: 1, book_id: 2, section_name: "Section 2", section_description: "Long Division", url_path: nil)

Chapter.create(teacher_id: 1, subject_id: 1, book_id: 1, section_id: 1, chapter_name: "chpt 1", chapter_description: "Meh", url_path: '/chapters/1')
# Chapter.create(teacher_id: 1, subject_id: 1, book_id: 1, section_id: 2, chapter_name: "chpt 2", chapter_description: "Meh", url_path: '/chapters/2')
# Chapter.create(teacher_id: 1, subject_id: 1, book_id: 1, section_id: 2, chapter_name: "chpt 3", chapter_description: "Meh", url_path: '/chapters/3')
# Chapter.create(teacher_id: 1, subject_id: 1, book_id: 1, section_id: 3, chapter_name: "chpt 4", chapter_description: "Meh", url_path: '/chapters/4')
# Chapter.create(teacher_id: 1, subject_id: 1, book_id: 2, section_id: 4, chapter_name: "chpt 5", chapter_description: "Meh", url_path: '/chapters/5')
# Chapter.create(teacher_id: 1, subject_id: 1, book_id: 2, section_id: 4, chapter_name: "chpt 6", chapter_description: "Meh", url_path: '/chapters/6')
# Chapter.create(teacher_id: 1, subject_id: 1, book_id: 2, section_id: 4, chapter_name: "chpt 7", chapter_description: "Meh", url_path: '/chapters/7')
# Chapter.create(teacher_id: 1, subject_id: 1, book_id: 2, section_id: 5, chapter_name: "chpt 8", chapter_description: "Meh", url_path: '/chapters/8')




Assignment.create(book_id: 1, lesson_id: 1, points: 10, assignment_title: "Homework1", assignment_description: "In your Textbook, do the first 5 problems. Bring to class on Monday!")
Assignment.create(book_id: 1, lesson_id: 1, points: 10, assignment_title: "Homework2", assignment_description: "In your Textbook, do the first 5 problems. Bring to class on Monday!")
Assignment.create(book_id: 1, lesson_id: 1, points: 10, assignment_title: "Homework3", assignment_description: "In your Textbook, do the first 5 problems. Bring to class on Monday!")
Assignment.create(book_id: 1, lesson_id: 1, points: 10, assignment_title: "Homework4", assignment_description: "In your Textbook, do the first 5 problems. Bring to class on Monday!")
Assignment.create(book_id: 1, lesson_id: 1, points: 10, assignment_title: "Homework5", assignment_description: "In your Textbook, do the first 5 problems. Bring to class on Monday!")


Grade.create(student_id: 2, book_id: 1, assignment_id: 1, grade_weight_index: 1, order_placement: 1, score_out_of_points: 8.5, teacher_note_for_grade: "Good Progress! Messed up a bit on problem 4")
Grade.create(student_id: 2, book_id: 1, assignment_id: 2, grade_weight_index: 0, order_placement: 1, score_out_of_points: 8.0, teacher_note_for_grade: "Good Progress! Messed up a bit on problem 3")
Grade.create(student_id: 2, book_id: 1, assignment_id: 3, grade_weight_index: 0, order_placement: 2, score_out_of_points: 7.0, teacher_note_for_grade: "Good Progress! Messed up a bit on problem 5")
Grade.create(student_id: 2, book_id: 1, assignment_id: 4, grade_weight_index: 1, order_placement: 2, score_out_of_points: 9.5, teacher_note_for_grade: "Good Progress! Messed up a bit on problem 1")
Grade.create(student_id: 2, book_id: 1, assignment_id: 5, grade_weight_index: 0, order_placement: 3, score_out_of_points: 0.0, teacher_note_for_grade: "INCOMPLETE!")




Lesson.create(teacher_id: 1, subject_id: 1, book_id: 1, section_id: 1, chapter_id: 1, lesson_name: "What are Digits?", lesson_description: "cool stuff!", url_path: nil)
Box.create(lesson_id: 1, ordering: 2, title: "Example 1", paragraph_id: 1)
Paragraph.create(box_id: 1, note_type: 5, paragraph_text: "This is a simple test of our system. Words should also be searchable via dictionary!")
Note.create(box_id: 1, user_id: 1, note_type: 5, text: "I am the Walrus")
# Box.create(lesson_id: 2, ordering: 1, title: "Challenge", written_content: "Lets see you try this! ", expression: "1+167+34+89+452")

# Box.create(lesson_id: 3, ordering: 1, title: "TBA", written_content: "TBA")
# Box.create(lesson_id: 4, ordering: 1, title: "TBA", written_content: "TBA")


