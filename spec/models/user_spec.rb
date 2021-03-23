require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create!(name: 'wilmer', email: 'wamg@example.com',
                 password: 'foobar', password_confirmation: 'foobar')
  end
  let(:wrong_user) { User.create!(name: ' ', email: ' ') }

  it 'user can be created' do
    expect(user).to be_valid
  end

  it 'name should be present' do
    user.name = ' '
    expect(user).to_not be_valid
  end

  it 'email should be present' do
    user.email = ' '
    expect(user).to_not be_valid
  end

  it 'name should not be too long' do
    user.name = 'a' * 51
    expect(user).to_not be_valid
  end

  it 'email should not be too long' do
    user.email = 'a' * 100 + '@gmail.com'
    expect(user).to_not be_valid
  end

  it 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org
                           user.name@example. foo@bar_baz.com foo@bar+baz.com]

    invalid_addresses.each do |_w|
      user.email = invalid_addresses
      expect(user).to_not be_valid
    end
  end

  it 'email addresses should be unique' do
    duplicate_user = user.dup
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it 'password should be present' do
    user.password = nil

    expect(user).to_not be_valid
  end

  it 'password should be have a minimum length' do
    user.password = 'a' * 5
    expect(user).to_not be_valid
  end

  describe 'User associations' do
    it 'has many groups' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq(:has_many)
    end
    it 'has many activities' do
      user = User.reflect_on_association(:activities)
      expect(user.macro).to eq(:has_many)
    end
  end
end
