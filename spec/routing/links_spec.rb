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

  it 'routes GET /:id run ApplicationController and #redirect action' do
    expect(get('/12345678')).to route_to(
      controller: 'links',
      action: 'redirect',
      id: '12345678')
  end
end
