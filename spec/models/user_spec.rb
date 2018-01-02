require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "requires an email address" do
    user = User.new
    expect(user).to be_invalid
  end

  it "should not have an email address that is too long" do
    email = "a" * 255 + "@test.com"
    user = User.create(email: email)
    expect(user).to be_invalid
  end

  it "should accept valid email addresses" do
    emails = %w[test@test.com user@user.com A-TEST-10@user.test.gov
                       testing.T.T.e.st.test@company.com]

    emails.each do |email|
      user = User.create(email: email)
      expect(user).to be_valid
    end
  end

  it "should not accept invalid email addresses" do
    emails = %w[testest.com user@user A-TEST-10@user.
                       testing.T.T.e.st.test@.test]

    emails.each do |email|
      user = User.create(email: email)
      expect(user).to be_invalid
    end
  end

  it "must have a unique email address" do
    email = "test@test.com"

    first_user = User.create(email: email)
    expect(first_user).to be_valid

    second_user = User.create(email: email)
    expect(second_user).to be_invalid
  end

end
