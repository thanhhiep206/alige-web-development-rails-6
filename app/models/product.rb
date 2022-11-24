class Product < ApplicationRecord
    has_many :line_items
    before_destroy :destroy_product_when_not_ref_line_items
    validates :title, :description, :image_url, :presence => true
    validates :title, :uniqueness => true, :length => {:minimum => 10, :message => "title is too short"}
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
        }
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }


    private

    def destroy_product_when_not_ref_line_items
      unless line_items.empty?
        errors.add(:base, "line_items present")  #neu line_items khong rong thi quang loi
        throw :abort
      end
    end
end
