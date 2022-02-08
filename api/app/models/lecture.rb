class Lecture < ApplicationRecord
  belongs_to :subject
  belongs_to :timetable
  has_many :attendance_classes, dependent: :destroy
  has_many :students, through: :attendance_classes

  validate :must_be_hope_day_after_today

  def must_be_hope_day_after_today
    if hope_day.present? && hope_day < Time.zone.today
      errors.add(:hope_day, '今日より前の日付を登録できません')
    end
  end
end
