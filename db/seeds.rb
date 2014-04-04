# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Question.create(title: Faker::Lorem.sentences(sentence_count = 1, supplemental = false), body: Faker::Lorem.sentences(sentence_count = 4, supplemental = false), user_id: 1)
end

50.times do
  Answer.create(content: Faker::Lorem.paragraph, question_id: (1 + rand(10)), user_id: 1)
end