require "./test/test_helper"
require "./lib/item"

class ItemTest < Minitest::Test
  def test_item_holds_appropriate_info
    i = Item.new({
              :id          => "2",
              :name        => "Pencil",
              :description => "You can use it to write things",
              :unit_price  => "3800",
              :merchant_id => "1",
              :created_at  => "2016-01-11 20:59:20 UTC",
              :updated_at  => "2009-12-09 12:08:04 UTC"
    })

    assert_equal 2, i.id
    assert_equal "Pencil", i.name
    assert_equal "You can use it to write things", i.description
    assert_equal BigDecimal.new(3800), i.unit_price
    assert_equal 1, i.merchant_id
    assert_equal Time.new("2016-01-11 20:59:20 UTC"), i.created_at
    assert_equal Time.new("2009-12-09 12:08:04 UTC"), i.updated_at
  end

  def test_item_holds_different_info
    i = Item.new({
              :id          => "2",
              :name        => "Bob Gu",
              :description => "Best Gu",
              :unit_price  => "3800000",
              :merchant_id => "2",
              :created_at  => "2017-01-11 20:59:20 UTC",
              :updated_at  => "2002-12-09 12:08:04 UTC"
    })

    assert_equal 2, i.id
    assert_equal "Bob Gu", i.name
    assert_equal "Best Gu", i.description
    assert_equal BigDecimal.new(3800000), i.unit_price
    assert_equal 2, i.merchant_id
    assert_equal Time.new("2017-01-11 20:59:20 UTC"), i.created_at
    assert_equal Time.new("2002-12-09 12:08:04 UTC"), i.updated_at
  end

  def test_unit_price_to_dollars
    i = Item.new({
              :id          => "1",
              :name        => "Pencil",
              :description => "You can use it to write things",
              :unit_price  => "3875",
              :merchant_id => "1",
              :created_at  => "2016-01-11 20:59:20 UTC",
              :updated_at  => "2009-12-09 12:08:04 UTC"
    })

    assert_equal 38.75, i.unit_price_to_dollars
  end

  def test_different_unit_price_to_dollars
    i = Item.new({
              :id          => "1",
              :name        => "Pencil",
              :description => "You can use it to write things",
              :unit_price  => "4075",
              :merchant_id => "1",
              :created_at  => "2016-01-11 20:59:20 UTC",
              :updated_at  => "2009-12-09 12:08:04 UTC"
    })

    assert_equal 40.75, i.unit_price_to_dollars
  end

end
