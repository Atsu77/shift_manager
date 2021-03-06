class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :timetables do |t|
      t.string :time_tables
      t.datetime :starting_time
      t.datetime :ending_time

      t.timestamps
    end

    create_table :lectures do |t|
      t.references :timetable, foreign_key: true
      t.references :subject, foreign_key: true
      t.datetime :hope_day

      t.timestamps
    end
  end
end
