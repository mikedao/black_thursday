require "./test/test_helper"
require "./lib/item"

class ItemTest < Minitest::Test
  def test_item_holds_appropriate_info

    i = Item.new({
              :name        => "Pencil",
              :description => "You can use it to write things",
              :unit_price  => 3800,
              :created_at  => "2016-01-11 20:59:20 UTC",
              :updated_at  => "2009-12-09 12:08:04 UTC",
    })

    assert_equal "Pencil", i.name
    assert_equal "You can use it to write things", i.description
    assert_equal BigDecimal.new(3800), i.unit_price
    assert_equal Time.new("2016-01-11 20:59:20 UTC"), i.created_at
    assert_equal Time.new("2009-12-09 12:08:04 UTC"), i.updated_at
  end
end
