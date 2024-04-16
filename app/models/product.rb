class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many_attached :images

  scope :newly_added, -> { order(created_at: :desc) }
  scope :recently_updated, -> { order(updated_at: :desc) }
  # Assuming a hypothetical discount_price for on_sale scope
  scope :on_sale, -> { where('discount_price < price') }

  def self.search(query)
    # Using LIKE for SQLite compatibility; ILIKE can be used for PostgreSQL for case-insensitive search
    where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
  end
end
