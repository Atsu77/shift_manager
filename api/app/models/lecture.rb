class Lecture < ApplicationRecord
  belongs_to :subject
  belongs_to :time_table
end
