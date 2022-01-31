class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.references :timetable, foreign_key: true
      t.references :subject, foreign_key: true
      t.datetime :hope_day

      t.timestamps
    end
  end
end
