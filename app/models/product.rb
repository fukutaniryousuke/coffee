class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :ganre


  def with_tax_price
    (price * 1.1).floor
  end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :price, presence: true
end
