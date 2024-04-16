class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :street, :city, :state, :postal_code, :country, presence: true

  def address_complete?
    street.present? && city.present? && state.present? && postal_code.present? && country.present?
  end
end