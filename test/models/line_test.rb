require 'test_helper'

class LineTest < ActiveSupport::TestCase
  test 'valid line' do
    brand = Brand.new(name: 'Shoyeido', country: 'Japan', description: 'Very Famous')
    brand.save
    line = Line.new(name: 'Daily', brand_id: brand.id, description: 'Daily use')
    assert line.valid?
  end

  test 'invalid without name' do
    brand = Brand.new(name: 'Shoyeido', country: 'Japan', description: 'Very Famous')
    brand.save
    line = Line.new(brand_id: brand.id, description: 'Daily use')
    refute line.valid?, 'line is invalid without a name'
    assert_not_nil line.errors[:name], 'no validation error for name present'
  end

  test 'approval defaults to false' do
    brand = Brand.new(name: 'Shoyeido', country: 'Japan', description: 'Very Famous')
    brand.save
    line = Line.new(name: 'Daily', brand_id: brand.id, description: 'Daily use')
    refute line.approved?
  end
end
