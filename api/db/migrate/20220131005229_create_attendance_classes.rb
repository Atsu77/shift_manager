class CreateAttendanceClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :attendance_classes do |t|
      t.integer :registration_number
      t.references :students, foreign_key: true
      t.references :lecture, foreign_key: true

      t.timestamps
    end
  end
end
