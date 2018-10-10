require 'rails_helper'

RSpec.describe LinksController do

  describe 'GET #new' do
    it 'returns http success code' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:link) { Link.create }
    it 'returns http success code' do
      get :show, params: { id: link.id }
      expect(response).to have_http_status(:success)
    end
  end
end
