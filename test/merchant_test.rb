require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'

class MerchantTest < Minitest::Test

  def test_merchant_has_a_name_and_id
    m = Merchant.new({:id => 5, :name => "Turing School"})
    assert_equal 5, m.id
    assert_equal "Turing School", m.name
  end

  def test_merchant_has_a_different_name_and_id
    m = Merchant.new({:id => 4, :name => "Terd School"})
    assert_equal 4, m.id
    assert_equal "Terd School", m.name
  end
end
