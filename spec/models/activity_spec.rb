require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:user) { User.create!(name: 'example', email: 'wamg@example.com',
    password: "foobar", password_confirmation: "foobar") }
  let(:group) {  Group.create(name: "Example Group", icon: "example icon", user_id: user.id ) }
  let(:activity) {  Activity.create(name: "Example activty", tiempo: 1, user_id: user.id, group_id: group.id ) }


    it 'Activity should be valid' do     
        expect(activity).to be_valid
    end

    it 'Activity can be created' do     
      expect(activity).to be_valid
    end

     it "name should be present" do
        activity.name = nil
        expect(activity).to_not be_valid
     end

     it "tiempo should be present" do
        activity.tiempo = nil
        expect(activity).to_not be_valid
     end

     it "user id should be present" do
        activity.user_id = nil
        expect(activity).to_not be_valid
     end

     it "user id should be present" do
        activity.user_id = nil
        expect(activity).to_not be_valid
     end

    # it "name should not be too long" do
    # user.email = "a" * 51
    # expect(user).to_not be_valid
    # end

end
