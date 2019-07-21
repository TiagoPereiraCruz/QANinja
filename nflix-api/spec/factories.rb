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

  factory :regitered_user, class: UserModel do
    id { 0 }
    full_name { "Tiago Pereira" }
    email { "tiagopereira1988@hotmail.com" }
    password { "jarvis123" }

    after(:build) do |user|
      # puts "cleaning test data by email #{user.email}"
      Database.new.delete_user(user.email)
      result = ApiUser.save(user.to_hash)
      user.id = result.parsed_response["id"]
    end
  end

  factory :user_wrong_email, class: UserModel do
    full_name { "Tiago Pereira" }
    email { "tiagopereira1988#hotmail.com" }
    password { "jarvis123" }
  end

  factory :empty_name_user, class: UserModel do
    full_name { "" }
    email { "tiagopereira1988@hotmail.com" }
    password { "jarvis123" }
  end

  factory :empty_email_user, class: UserModel do
    full_name { "Tiago Pereira" }
    email { "" }
    password { "jarvis123" }
  end

  factory :empty_password_user, class: UserModel do
    full_name { "Tiago Pereira" }
    email { "tiagopereira1988@hotmail.com" }
    password { "" }
  end

  factory :null_name_user, class: UserModel do
    email { "tiagopereira1988@hotmail.com" }
    password { "jarvis123" }
  end

  factory :null_email_user, class: UserModel do
    full_name { "Tiago Pereira" }
    password { "jarvis123" }
  end

  factory :null_password_user, class: UserModel do
    full_name { "Tiago Pereira" }
    email { "tiagopereira1988@hotmail.com" }
  end
end
