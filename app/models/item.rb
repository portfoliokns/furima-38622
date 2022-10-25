class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payment_method
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, presence: true
  validates :discription, presence: true

  #プルダウンの選択が「---」の時は保存できないように設定してある
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :payment_method_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  with_options presence: true, format: { with: VALID_NAME_REGEX, message: 'is ???',allow_blank: true } do
    validates :seelling_price
  end

end
