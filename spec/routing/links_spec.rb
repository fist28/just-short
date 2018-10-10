require 'rails_helper'

RSpec.describe 'Routes for LinksController' do
  it 'routes GET /links/new run LinksController and #new action' do
    expect(get('/links/new')).to route_to("links#new")
  end

  it 'routes GET /links/:id run LinksController and #show action' do
    expect(get('/links/123')).to route_to(
      controller: 'links',
      action: 'show',
      id: '123')
  end

  it 'routes POST /links run LinksController and #create action' do
    expect(post('/links')).to route_to("links#create")
  end

  context 'correct id pattern' do
    it 'routes GET /:id run LinksController and #redirect action' do
      expect(get('/12345678')).to route_to(
        controller: 'links',
        action: 'redirect',
        id: '12345678')
    end
  end

  context 'incorrect id pattern' do
    it 'routes GET /:id redirect to 404 page' do
      expect(get('/123456789')).not_to route_to(
        controller: 'links',
        action: 'redirect')
    end
  end
end
