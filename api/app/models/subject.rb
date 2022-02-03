class Subject < ApplicationRecord
  has_many :lectures
  belongs_to :student_distinction
end
