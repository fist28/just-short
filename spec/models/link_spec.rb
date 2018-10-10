require 'rails_helper'

RSpec.describe Link do
  let(:link) { create(:link) }

  it 'link has created_at field' do
    expect(link.created_at).to be
  end
  it 'link has updated_at field' do
    expect(link.updated_at).to be
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

  context '#id_present(id)' do
    it 'return true if object exist in database' do
      expect(Link.id_present?(link.id)).to be_truthy
    end
    it 'return false if object not exist in database' do
      expect(Link.id_present?('12345678')).to be_falsey
    end
  end
end
