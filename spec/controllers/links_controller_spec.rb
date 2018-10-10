require 'rails_helper'

RSpec.describe LinksController do

  describe 'GET #new' do
    it 'returns http success status' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:link) { create(:link) }
    it 'returns http success status' do
      get :show, params: { id: link.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'correct link' do
      before do
        post :create, params: { link: attributes_for(:link)}
      end

      it 'returns http redirect status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'redirect to created link' do
        expect(response).to redirect_to(Link.last)
      end

      it 'create a new Link' do
        expect{
          post :create, params: { link: attributes_for(:link)}
          }.to change(Link,:count).by(1)
      end
    end

    context 'incorrect link' do
      before do
        post :create, params: { link: { destination: 'example.com' }}
      end

      it 'returns http success status' do
        expect(response).to have_http_status(:success)
      end

      it 'render new' do
        expect(response).to render_template(:new)
      end

      it 'not create a Link' do
        expect{
          post :create, params: { link: { destination: 'example.com' }}
          }.to change(Link,:count).by(0)
      end

    end
  end

  describe 'GET #redirect' do
    context 'correct link id' do
      let(:link) { create(:link) }

      it 'returns http success status' do
        get :redirect, params: { id: link.id }
        expect(response).to have_http_status(:redirect)
      end

      it 'returns http success status' do
        get :redirect, params: { id: link.id }
        expect(response).to redirect_to(link.destination)
      end
    end

    context 'incorrect link id' do
      it 'returns http not found status' do
        get :redirect, params: { id: '12345678' }
        expect(response).to have_http_status(:not_found)
      end
    end

  end
end
