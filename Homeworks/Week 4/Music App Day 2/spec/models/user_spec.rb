require 'rails_helper'

# create specs for
# Presence of email
# Presence of password_digest
# Length of password > 6
# Refer to the docs as needed.

#is_password?, #reset_session_token, and ::find_by_credentials.


RSpec.describe User, type: :model do

  subject(:user) {User.new(
    email: "syriebianco@gmail.com",
    password_digest: BCrypt::Password.create('password'),
    session_token: SecureRandom.base64(16)
    )}

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    describe "is_password? method" do
      it "should compare the password_digest to the argument password"
      it "should return true if the password matches the password_digest"
      it "should return false if the password does not match the password_digest"
    end

    describe "reset_session_token method" do
      it "should reassign the session_token of the user"
      it "should generate a SecureRandom token"
    end

    describe "User.find_by_credentials method" do
      it "should return nil if the user does not exist"
      it "should return nil if the username and password is incorrect"
      it "should return true if the username and password match"
      it "should call the is_password? method"
    end


  end
end
