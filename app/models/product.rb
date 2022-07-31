class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :ganre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :price, presence: true
end
