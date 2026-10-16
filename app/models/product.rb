class Product < ApplicationRecord
  # 商品画像を1枚添付する
  has_one_attached :image

  # 商品画像を150×150以内にリサイズする
  def thumbnail
    image.variant(resize_to_fit: [150, 150]).processed
  end
end