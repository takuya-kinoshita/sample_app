FactoryBot.define do
  factory :user, class: User do
    first_name {"yamao"}
    last_name {"yamada"}
    sequence(:email) {|n| "yamao#{n}@gmail.com"}
    password {"password"}
    password_confirmation {"password"}    
  end
end
