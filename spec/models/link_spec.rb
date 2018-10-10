require 'rails_helper'

RSpec.describe Link do
  let(:link) { Link.create(destination: 'https://example.com') }
  xit 'create link object' do
    expect(link).to eq Link.last
  end

  context 'generate id' do
    it 'id is 8 characters long' do
      id = Link.generate_id
      expect(id.length).to eq 8
    end

    it 'generated is is unique' do
      ids = []
      100.times { ids << Link.generate_id }
      expect(ids.uniq.size).to eq 100
    end
  end
end
