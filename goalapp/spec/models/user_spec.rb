require 'rails_helper'

RSpec.describe User, type: :model do

    describe "validations" do
        it { should validate_presence_of(:email) }
        # it { should validate_uniqueness_of(:email) }
        it { should validate_length_of(:password).is_at_least(6) }
        it { should validate_presence_of(:session_token) }
        it { should validate_presence_of(:password_digest) }
        # it { should validate_uniqueness_of(:session_token) }
        #associations validations# go here
        # describe 'uniqueness' do
        #     before(:each) do 
        #         User.create!(Faker::internet.email)
        # end
    end

    describe '#is_password?' do 
        user = User.new(email: 'abc@abc.com', password: 'apples123')

        context 'with a valid password' do
            it 'returns true' do
                expect(user.is_password?('apples123')).to be(true)
            end
        end

        context 'w/invalid password' do
            it 'returns false' do
                expect(user.is_password?('thisiswrong')).to be(false) 
            end
        end
    end

    # describe "::find by credentials" do
        
    # end


end

# Write model specs for User. Remember, model specs should test your model's validations, associations, 
# and class scope methods (eg. User::find_by_credentials). 
# Use shoulda-matchers to write tests for each of the validations in your user model. 
# You won't have any associations written on your user model to begin with;
# go back and fill these in as you go. Refer to the reading on RSpec Model Testing as needed.