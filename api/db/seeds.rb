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
