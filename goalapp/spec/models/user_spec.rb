require 'rails_helper'

RSpec.describe User, type: :model do

    subject!(:user2) { User.create!(email: 'abc2@abc.com', password: 'apples123') }
    subject!(:user) { User.create!(email: 'abc@abc.com', password: 'apples123') } 

    describe "validations" do
        it { should validate_presence_of(:email) }
        # it { should validate_uniqueness_of(:email) }
        it { should validate_length_of(:password).is_at_least(6) }
        # it { should validate_presence_of(:session_token) }
        it { should validate_presence_of(:password_digest) }
        # it { should validate_uniqueness_of(:session_token) }
        #associations validations# go here
    end
        
    describe '#is_password?' do 
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
    
    describe "::find by credentials" do
        context 'with valid credentials' do
            it 'finds user in database by user creds' do
                expect(User.find_by_credentials('abc@abc.com', 'apples123')).to eq(user)
            end
        end

        context 'w/out valid credentials' do
            it 'finds user in database by user creds' do
                    expect(User.find_by_credentials('abc5@abc.com', 'apple')).to be(nil)
            end
        end
    end

    describe "#reset_session_token" do
        debugger
        it 'resets session token' do
            
        end

        it 'updates the database' do
        end
    end


end
