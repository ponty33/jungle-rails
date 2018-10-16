require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'should be valid if all field are included' do
      @user = User.new(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      expect(@user).to be_valid
    end

    it 'should not be valid if conformation mismatch' do
      @user = User.new(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'hbcdefgh')
      expect(@user).to_not be_valid
    end

    it 'should be an unique email' do
      @user1 = User.create(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      @user2 = User.new(name: 'name2', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      expect(@user2).to_not be_valid
    end

    it 'should not be valid if email is missing' do
      @user = User.new(name: 'name', email: nil, password: 'abcdefgh', password_confirmation: 'abcdefgh')
      expect(@user).to_not be_valid
    end

    it 'should not be valid if password is too short' do
      @user = User.new(name: 'name', email: 'abc@abc.com', password: 'short', password_confirmation: 'short')
      expect(@user).to_not be_valid
    end




  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should be valid if all field are included' do
      user1 = User.create(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      user = User.authenticate_with_credentials(user1.email, user1.password)
      expect(user).to be_a(User)
    end

    it 'should be invalid if no email' do
      user1 = User.create(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      user = User.authenticate_with_credentials(nil, user1.password)
      expect(user).to be_nil
    end

    it 'should be invalid if no password' do
      user1 = User.create(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      user = User.authenticate_with_credentials(user1.email, nil)
      expect(user).to be_nil
    end

    it 'should be valid if leading and trailing space included in email' do
      user1 = User.create(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      user = User.authenticate_with_credentials(' abc@abc.com ', user1.password)
      expect(user).to be_a(User)
    end

    it 'should be valid if leading and trailing space included in email' do
      user1 = User.create(name: 'name', email: 'abc@abc.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      user = User.authenticate_with_credentials('ABC@ABC.com', user1.password)
      expect(user).to be_a(User)
    end

  end

end


# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end