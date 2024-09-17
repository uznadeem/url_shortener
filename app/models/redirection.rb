class Redirection < ApplicationRecord
  has_many :visits, dependent: :destroy

  validates_url :url_address, url: true
  validates :alias, uniqueness: true, length: { in: 5..15 }, allow_blank: true

  before_validation :generate_alias, on: :create

  private

  def generate_alias
    self.alias = SecureRandom.urlsafe_base64(6)[0, 6] if self.alias.blank?
  end
end
