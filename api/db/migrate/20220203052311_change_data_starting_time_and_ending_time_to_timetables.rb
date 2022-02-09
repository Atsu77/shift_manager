class ChangeDataStartingTimeAndEndingTimeToTimetables < ActiveRecord::Migration[6.1]
  def change
    change_column :timetables, :starting_time, :string
    change_column :timetables, :ending_time, :string
  end
end
