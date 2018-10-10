FactoryBot.define do
  factory :link do
    destination { Faker::Internet.url('example.com') }
  end
end
