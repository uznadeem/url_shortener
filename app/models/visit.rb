class Visit < ApplicationRecord
  belongs_to :redirection
  validates :ip_address, presence: true
end
