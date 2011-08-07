class Product < ActiveRecord::Base
  has_many :line_items

  def self.find_products_for_sale
    find(:all,:order => "title")
  end

  
  validates_presence_of :title, :description, :image_url, :price
  validates_uniqueness_of :title
  validates_numericality_of :price

  protected
    def price_must_be_at_least_a_cent
      errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
    end

validate  :price_must_be_at_least_a_cent

end
