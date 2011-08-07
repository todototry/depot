require 'test_helper'


class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "invalid with empty attribute" do
    
    product = Product.new
    assert  !product.valid?
     # assert  product.errors.attribute.any?(:title)
     # assert  product.errors.attribute.any?(:description)
     # assert  product.errors.attribute.any?(:price)
     # assert  product.errors.attribute.any?(:image_url)
    product = products(:one)
    assert !product.save
    assert_equal ["should be at least 0.01"],product.errors[:price]
    assert_equal nil , product.errors[:title]
    assert_not_equal [],product.errors
  end
end
