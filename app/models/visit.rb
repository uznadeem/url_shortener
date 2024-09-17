class Visit < ApplicationRecord
  belongs_to :redirection
  validates :ip_address, :browser, :operating_system, presence: true
end
