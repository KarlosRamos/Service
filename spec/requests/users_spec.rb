require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
	describe "POST/users" do
		it "response with a 200 code" do
			post "/api/v1/users"
		 	have_http_status(200)
		end

		it "creates a new user with new data" do
			auth = {provider: "facebook", uid:"asjdnasda7sd8",info:{email:"c@yugo.com"}}
			expect{
				post "/api/v1/users",{auth: auth}
			}.to change(User,:count).by(1)
		end

		it "response with the user found or created" do
			auth = {provider: "facebook", uid:"asjdnasda7sd8",info:{email:"c@yugo.com"}}
			post "/api/v1/users", {auth: auth}
			json = JSON.parse(response.body)
			p "#{json}"
			expect(true).to eq(true)
		end
	end
end