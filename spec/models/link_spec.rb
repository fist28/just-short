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

  context 'validation' do
    context 'destination' do
      it 'can not be blank' do
        link = Link.new(destination: '')
        link.valid?
        expect(link.errors['destination']).to include('is invalid')
      end

      it 'can not be without protocol' do
        link = Link.new(destination: 'example.com')
        link.valid?
        expect(link.errors['destination']).to include('is invalid')
      end

      it 'can be with http protocol' do
        link = Link.new(destination: 'http://example.com')
        link.valid?
        expect(link.errors['destination']).not_to include('is invalid')
      end

      it 'can be with https protocol' do
        link = Link.new(destination: 'https://example.com')
        link.valid?
        expect(link.errors['destination']).not_to include('is invalid')
      end
    end
  end
end
