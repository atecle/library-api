require 'rails_helper'

RSpec.describe Book, type: :model do

  it 'has a valid factory' do
    expect(FactoryBot.create(:book)).to be_valid
  end

end
