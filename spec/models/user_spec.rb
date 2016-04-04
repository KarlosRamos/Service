require 'rails_helper'

RSpec.describe User, type: :model do
	it { should validate_presence_of(:email) }
	it { should_not allow_value("carlos@yugo").for(:email)}
	it { should allow_value("carlos@yugo.com").for(:email)}
	it { should validate_presence_of(:uid)}
	it { should validate_presence_of(:provider)}

	it "deveria crear un usurio si el uid y provider no existen" do 
		expect{
			User.from_omniauth({uid: "12345",provider: "facebook",info: {email:"c@yugo.com"}})
		}.to change(User,:count).by(1)
	end

	it "deberia encontrar un usuario si el uid y provider ya existen" do 
		user = FactoryGirl.create(:user)
		expect{
			User.from_omniauth({uid: user.uid,provider: user.provider,info: {email:"c@yugo.com"}})
		}.to change(User,:count).by(0)
	end

	it "retorna el user , uid si el user existe" do
		user = FactoryGirl.create(:user)
		expect(
			User.from_omniauth({uid: user.uid,provider: user.provider})
		).to eq(user)
	end

end
