require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    let!(:books) { FactoryBot.create_list(:book, 10) }

    before { get :index }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns all books' do
      body = JSON.parse(response.body)
      expect(body.size).to eq(10)
    end
  end

end
