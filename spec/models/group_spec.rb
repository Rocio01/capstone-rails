require 'rails_helper'

RSpec.describe Group, type: :model do
    let(:user) { User.create!(name: 'example', email: 'wamg@example.com',
                                       password: "foobar", password_confirmation: "foobar") }
    let(:group) {  Group.create!(name: "Example Group", icon: "example icon", user_id: user.id ) }

        it 'Group should be valid' do     
             expect(group).to be_valid
        end

        it "name should be present" do
             group.name = nil
             expect(group).to_not be_valid
         end

        it "logo should be present" do
             group.icon = nil
             expect(group).to_not be_valid
        end

        it "user id should be present" do
            group.user_id = nil
             expect(group).to_not be_valid
         end

        it "name should not be too long" do
             user.email = "a" * 51
            expect(user).to_not be_valid
        end

      
 end