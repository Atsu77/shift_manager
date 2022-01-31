class CreateTimetables < ActiveRecord::Migration[6.1]
  def change
    create_table :timetables do |t|
      t.string :time_tables
      t.datetime :starting_time
      t.datetime :ending_time

      t.timestamps
    end
  end
end
