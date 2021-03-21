require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:user) do
    User.create!(name: 'wilmer', email: 'wamg@example.com',
                 password: 'foobar', password_confirmation: 'foobar')
  end
  let(:group) { Group.create(name: 'Example Group', icon: 'example icon', user_id: user.id) }
  let(:activity) { Activity.create(name: 'Example activity', activity_time: 1, user_id: user.id, group_id: group.id) }

  it 'activity can be created' do
    expect(activity).to be_valid
  end

  it 'name should be present' do
    activity.name = ' '
    expect(activity).to_not be_valid
  end

  it 'activity_time should be present' do
    activity.activity_time = ' '
    expect(activity).to_not be_valid
  end

  it 'name should not be too long' do
    activity.name = 'a' * 51
    expect(activity).to_not be_valid
  end

  it 'user_id should be present' do
    activity.user_id = nil
    expect(activity).to_not be_valid
  end

  it 'group_id should be optional' do
    activity.group_id = nil
    expect(activity).to be_valid
  end
end
