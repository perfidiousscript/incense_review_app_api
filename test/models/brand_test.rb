require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  test 'valid brand' do
    brand = Brand.new(name: 'Shoyeido', country: 'Japan', description: 'Very Famous')
    assert brand.valid?
  end

  test 'invalid without name' do
    brand = Brand.new(country: 'Japan', description: 'Very Famous')
    refute brand.valid?, 'brand is invalid without a name'
    assert_not_nil brand.errors[:name], 'no validation error for name present'
  end

  test 'approval defaults to false' do
    brand = Brand.new(name: 'Shoyeido', country: 'Japan', description: 'Very Famous')
    refute brand.approved?
  end
end
