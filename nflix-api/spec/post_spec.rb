describe "post" do
  context "when new user" do
    before do
      @new_user = build(:user).to_hash
      @result = ApiUser.save(@new_user)
    end
    it { expect(@result.response.code).to eql "200" }
  end

  context "when wrong email" do
    before do
      @new_user = build(:user_wrong_email).to_hash
      @result = ApiUser.save(@new_user)
    end
    it { expect(@result.response.code).to eql "412" }
    it { expect(@result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
  end
end #

# describe "post" do
#   context "when new user" do
#     before do
#       @new_user = build(:user).to_hash

#       @result = HTTParty.post(
#         "http://192.168.99.100:3001/user",
#         body: @new_user.to_json,
#         headers: {
#           "Content-Type" => "application/json",
#         },
#       )
#     end

#     it { expect(@result.response.code).to eql "200" }
#   end

#   context "when wrong email" do
#     before do
#       @new_user = build(:user_wrong_email).to_hash

#       @result = HTTParty.post(
#         "http://192.168.99.100:3001/user",
#         body: @new_user.to_json,
#         headers: {
#           "Content-Type" => "application/json",
#         },
#       )
#     end
#     it { expect(@result.response.code).to eql "412" }
#     it { expect(@result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
#   end
# end

# describe "post" do
#   context "when new user" do
#     before do
#       @new_user = { full_name: "Tiago Pereira", email: "tiagopereira1989@hotmail.com", password: "jarvis123" }
#       Database.new.delete_user(@new_user[:email])

#       @result = HTTParty.post(
#         "http://192.168.99.100:3001/user",
#         body: @new_user.to_json,
#         headers: {
#           "Content-Type" => "application/json",
#         },
#       )
#     end

#     it { expect(@result.response.code).to eql "200" }
#   end
# end

# describe "cadastro" do
#   it "novo usuario" do
#     Database.new.delete_user("tiagopereira1989@hotmail.com")

#     result = HTTParty.post(
#       "http://192.168.99.100:3001/user",
#       body: { full_name: "Tiago Pereira",
#               email: "tiagopereira1989@hotmail.com",
#               password: "jarvis123" }.to_json,
#       headers: {
#         "Content-Type" => "application/json",
#       },
#     )
#     puts result
#     expect(result.response.code).to eql "200"
#   end
# end
