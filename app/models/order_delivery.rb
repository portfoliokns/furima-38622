class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :token, :price

  VALID_POSTCODE_FORMAT = /\A[0-9]{3}-[0-9]{4}\z/
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,
      format: {with: VALID_POSTCODE_FORMAT, message: "is invalid. Enter it as follows (e.g. 123-4567)", allow_blank: true }
    validates :municipality
    validates :house_number
    validates :phone_number,
      numericality: {only_integer: true, message: "is invalid. Input only number", allow_blank: true },
      length: {in: 10..11, message: "is too short", allow_blank: true}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,
            house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end