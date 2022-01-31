class CreateStudentDistinctions < ActiveRecord::Migration[6.1]
  def change
    create_table :student_distinctions do |t|
      t.string :distinction

      t.timestamps
    end
  end
end
