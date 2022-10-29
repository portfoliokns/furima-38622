class HistoryDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number

  VALID_POSTCODE_FORMAT = /\A[0-9]{3}-[0-9]{4}\z/
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,
      format: {with: VALID_POSTCODE_FORMAT, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id,
      numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :house_number 
    validates :phone_number,
      numericality: {only_integer: true, message: "is invalid. Input only number"}
      length: {in: 10..11, message: "Phone number is valid. "}
  end
  validates :building_name

  def save
    history = Donation.create(user_id: user_id, item_id: user_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
  
end