require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(
    first_name: "salim",
    last_name: "mustafa",
    email: "salim@example.com",
    password: "hello",
    password_confirmation: "hello"
  )}

  describe 'Validations' do
    it 'should should not pass with nil password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid without password_confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid without matching password and p.confirmation' do
      subject.password = 'yolo'
      expect(subject).to_not be_valid
    end

    it 'should not pass without first_name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'should not pass without last_name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'should not pass without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should not pass if password length is less than 4 characters' do
      subject.password = '123'
      subject.password_confirmation = '123'
      expect(subject).to_not be_valid
    end

    describe '.authenticate_with_credentials' do
      it 'should return a user if user exist' do
        subject.save
        @user = User.authenticate_with_credentials('salim@example.com', 'hello')
        expect(@user).to_not be_nil
      end

      it 'should return nil if user does not exist' do
        subject.save
        @user = User.authenticate_with_credentials('hello@example.com', 'yolo')
        expect(@user).to be_nil
      end

    end
  end
end