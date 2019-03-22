class LineItem < ActiveRecord::Base

  belongs_to :order
  has_many :products

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

end
