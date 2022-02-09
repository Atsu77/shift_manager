class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :student_distinctions do |t|
      t.string :distinction

      t.timestamps
    end

    create_table :subjects do |t|
      t.string :subject_name
      t.references :student_distinction, foreign_key: true

      t.timestamps
    end

  end
end
