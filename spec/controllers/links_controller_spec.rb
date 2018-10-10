require 'rails_helper'

RSpec.describe LinksController do

  describe 'GET #new' do
    it 'returns http success status' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:link) { Link.create }
    it 'returns http success status' do
      get :show, params: { id: link.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    before do
      post :create, params: { link: { destination: 'example.com' }}
    end

    it 'returns http redirect status' do
      expect(response).to have_http_status(:redirect)
    end

    it 'create a new Link' do
      expect{
        post :create, params: { link: { destination: 'example.com' }}
        }.to change(Link,:count).by(1)
    end
  end
end
