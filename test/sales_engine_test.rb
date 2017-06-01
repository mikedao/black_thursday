require "./test/test_helper"
require "./lib/sales_engine"


class SalesEngineTest < Minitest::Test

  def test_se_takes_csv_hashes
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
    })

    assert_instance_of MerchantRepository, se.merchants
    assert_instance_of ItemRepository, se.items
  end

  def test_se_can_find_items_by_merchant_id
    se = SalesEngine.from_csv({
      :items     => "./test/fixtures/items_fixture.csv",
      :merchants => "./test/fixtures/merchants_fixture.csv",
    })

    result = se.find_items_by_merchant_id(4)

    assert_instance_of Array, result
    assert_equal 2, result.count
    assert_equal 1, result.first.id
    assert_equal 2, result.last.id
  end
end
