FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.sentences(sentence_count = 1, supplemental = false) }
    body { Faker::Lorem.sentences(sentence_count = 4, supplemental = false) }
    user
  end

  factory :user do
    username {Faker::Name.name}
    email {Faker::Internet.email}
    password {"winteriscoming"}
  end

  factory :answer do
    content {Faker::Lorem.word}
    user
    question
  end

  factory :vote do
    value
    votable_id
    votable_type
    user
  end
end
