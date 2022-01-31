class AddStudentdistinctionToSubject < ActiveRecord::Migration[6.1]
  def change
    add_reference :subjects, :student_distinctions, foreign_key: true
  end
end
