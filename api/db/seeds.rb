# 担当科目と科目の区割りをDBに登録
all_distinction_subject = %w[国語 社会 理科 英語]
primary_school_distinction_subject = ['算数']
# junior_high_school_distinction_subject = []
high_school_distinction_subject = %w[日本史 世界史 地理 現代社会 数学ⅠA 数学ⅡB 数学Ⅲ 物理 化学 生物]

all_distinction = StudentDistinction.create!(distinction: '全対象')
all_distinction_subject.each do |subject|
  all_distinction.subjects.create!(subject_name: subject)
end

primary_school_distinction = StudentDistinction.create!(distinction: '小学生')
primary_school_distinction_subject.each do |subject|
  primary_school_distinction.subjects.create!(subject_name: subject)
end

StudentDistinction.create!(distinction: '中学生')

high_school_distinction = StudentDistinction.create!(distinction: '高校生')
high_school_distinction_subject.each do |subject|
  high_school_distinction.subjects.create!(subject_name: subject)
end

# タイムテーブルを追加
time_tables = {
  'S': {
    'starting_time': '13:50',
    'ending_time': '15:05'
  },
  'A': {
    'starting_time': '15:15',
    'ending_time': '16:45'
  },
  'B': {
    'starting_time': '16:55',
    'ending_time': '18:25'
  },
  'C': {
    'starting_time': '18:35',
    'ending_time': '20:05'
  },
  'D': {
    'starting_time': '20:15',
    'ending_time': '21:45'
  }
}

time_tables.each do |time_table, value|
  Timetable.create!(time_tables: time_table, starting_time: value[:starting_time], ending_time: value[:ending_time])
end

# メインの生徒を一人作成する
Student.create!(name: 'test_student',
                email: 'test_student@example.com',
                password: 'password',
                address: 'address',
                phone_number: '09012345678')

# 生徒をまとめて生成する
50.times do |n|
  name = Faker::Name.name
  email = "student-#{n + 1}@example.com"
  password = 'password'
  phone_number = '09012345678'
  address = 'address'
  Student.create!(name: name,
                  email: email,
                  password: password,
                  address: address,
                  phone_number: phone_number)
end
