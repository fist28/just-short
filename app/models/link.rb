class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :destination, type: String
  field :_id, type: String, default: -> { Link.generate_id }

  validates :destination, format: { with: URI.regexp }

  private

  def self.generate_id
    loop do
      id = SecureRandom.hex(4)
      break id unless id_present?(id)
    end
  end

  def self.id_present?(id)
    Link.where(_id: id).present?
  end
end
