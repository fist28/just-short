require 'rails_helper'

RSpec.describe 'Routes for ApplicationController' do
  it 'routes GET /:id run ApplicationController and #redirect action' do
    expect(get('/12345678')).to route_to(
      controller: 'application',
      action: 'redirect',
      id: '12345678')
  end
end
