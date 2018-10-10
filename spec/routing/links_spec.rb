require 'rails_helper'

RSpec.describe 'Routes for LinksController' do
  it 'routes GET /links/new run LinksController and #new action' do
    expect(get('/links/new')).to route_to("links#new")
  end
end
