FactoryBot.define do
  factory :lecture do
    timetable_id { 1 }
    subject_id { 1 }
    hope_day { Time.zone.today + 1 }
  end
end
