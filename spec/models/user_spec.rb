require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'can create a valid user' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      expect(@user).to be_a User
    end

    it 'has equal password and password_confirmation fields' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '123456',
        password_confirmation: '456789'
      })
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'has a unique email address (not case-sensitive)' do
      @user1 = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      @user2 = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'JoE_sOmEtHiNg@email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      expect(@user2.errors[:email]).to include("has already been taken")
    end

    it 'has an email' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: nil,
        password: '123456',
        password_confirmation: '123456'
      })
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'has a first name' do
      @user = User.create({
        first_name: nil,
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'has a last name' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '12345',
        password_confirmation: '12345'
      })
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

  end


  describe '.authenticate_with_credentials' do
    it 'returns nil if email address not found' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      method = User.authenticate_with_credentials('something_else@email.com', '123456')
      expect(method).to be nil
    end

    it 'returns the user if email address is found' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      method = User.authenticate_with_credentials('joe_something@email.com', '123456')
      expect(method).to be_a User
    end

    it 'still authenticates if user typed accidental spaces before email' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      method = User.authenticate_with_credentials('  joe_something@email.com', '123456')
      expect(method).to be_a User
    end

    it 'authenticates email regardless of letter case' do
      @user = User.create({
        first_name: 'Joe',
        last_name: 'Something',
        email: 'joe_something@Email.com',
        password: '123456',
        password_confirmation: '123456'
      })
      method = User.authenticate_with_credentials('JoE_sOmEtHiNg@email.com', '123456')
      expect(method).to be_a User
    end

  end

end
