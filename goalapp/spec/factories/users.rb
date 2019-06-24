FactoryBot.define do 
    factory :user do 
        email { Faker::Internet.email }
        password { 'apples123' }
    end
end