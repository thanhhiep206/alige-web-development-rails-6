class Order < ApplicationRecord

  has_many :line_items, dependent: :destroy
  enum payment_type: {check: 0, credit_card: 1, purchase_order: 2}

  validates :name, :email, :address, presence: true


  def add_line_items_form_cart(cart)
    line_items_form_cart = cart.line_items
    line_items_form_cart.each do |item|
      item.cart_id = nil
      self.line_items << item
    end
  end
end
