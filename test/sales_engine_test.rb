require "./test/test_helper"
require "./lib/sales_engine"


class SalesEngineTest < Minitest::Test

  def test_se_takes_csv_hashes


    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
    })

    assert_instance_of MerchantRepository, se.merchant_repo
    assert_instance_of ItemRepository, se.item_repo
  end
end
