require_relative "models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Tiago Pereira" }
    email { "tiagopereira1988@hotmail.com" }
    password { "jarvis123" }

    after(:build) do |user|
      # puts "cleaning test data by email #{user.email}"
      Database.new.delete_user(user.email)
    end
  end

  factory :user_wrong_email, class: UserModel do
    full_name { "Tiago Pereira" }
    email { "tiagopereira1988#hotmail.com" }
    password { "jarvis123" }
  end
end
