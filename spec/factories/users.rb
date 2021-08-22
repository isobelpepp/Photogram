FactoryBot.define do
  factory :user do
    email { "email@email.com" }
    password { 'password' }
    name { 'Test' }
    website { 'example.com' }
    bio { 'This is my bio' }
    id { 1 }
  end
end
