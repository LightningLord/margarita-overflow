FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.sentences(sentence_count = 1, supplemental = false) }
    body { Faker::Lorem.sentences(sentence_count = 4, supplemental = false) }
    user_id { 2 }
  end
end
