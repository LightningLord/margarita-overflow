require 'json'
require 'net/http'

def open(url)
  Net::HTTP.get(URI.parse(url))
end

page_content = open('http://api.chrisvalleskey.com/fillerama/get.php?count=100&format=json&show=starwars')
parsed = JSON.parse(page_content)

users = ["Han Solo", "Luke Skywalker", "Bib Fortuna", "Boba Fett", "Princess Leia", "R2D2", "C3P0", "Wedge Antilles", "Darth Vader", "Jabba"]

10.times do |x|
  Question.create(title: parsed["db"][x+50]["quote"], body: Faker::Lorem.paragraph, user_id: (1+rand(10)))
end

50.times do |x|
  Answer.create(content: parsed["db"][x]["quote"], question_id: (1 + rand(10)), user_id: (1+rand(10)))
end

10.times do
  user = User.create! :username => users.pop, :email => Faker::Internet.email, :password => 'topsecret', :password_confirmation => 'topsecret'
end