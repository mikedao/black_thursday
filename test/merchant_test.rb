require "./test/test_helper"
require "./lib/merchant"

class MerchantTest < Minitest::Test

  def test_merchant_has_id_and_name
    m = Merchant.new({:id => "5", :name => "Turing School"})

    assert_equal 5, m.id
    assert_equal "Turing School", m.name
  end

  def test_merchant_has_different_id_and_name
    m = Merchant.new({:id => "265", :name => "Kenny Carpets"})

    assert_equal 265, m.id
    assert_equal "Kenny Carpets", m.name
  end

  def test_merchant_has_items_calls_parent
    parent = Minitest::Mock.new
    data = {:id => "265", :name => "Kenny Carpets"}
    merchant = Merchant.new(data, parent)
    parent.expect(:find_items_by_merchant_id, nil, [265])

    merchant.items

    parent.verify
  end
end
