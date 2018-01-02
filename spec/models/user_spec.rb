require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "requires an email address" do
    user = User.new
    expect(user).to be_invalid
  end

end
