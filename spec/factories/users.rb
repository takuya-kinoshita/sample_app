FactoryBot.define do
  factory :user do
    first_name { "takuya"}
    last_name { "kinoshita"}
    email { "kkk@gmail.com" }
    password { "password" }
    password_confirmation { "password" }    
  end
end
