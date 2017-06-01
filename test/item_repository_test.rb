require "./test/test_helper"
require "./lib/item_repository"

class ItemRepositoryTest < Minitest::Test
  def setup
    path = "./test/fixtures/items_fixture.csv"
    @data = FileIO.read_file(path)
  end

  def test_all_returns_all_items
    ir = ItemRepository.new(@data)

    assert_instance_of Array, ir.all
    assert_equal 12, ir.all.count
    assert ir.all.all? { |item| item.is_a?(Item) }
  end

  def test_find_by_id
    ir = ItemRepository.new(@data)

    result = ir.find_by_id(263395237)

    assert_instance_of Item, result
    assert_equal 263395237, result.id
    assert_equal "510+ RealPush Icon Set", result.name
  end

  def test_cant_find_by_id
    ir = ItemRepository.new(@data)

    result = ir.find_by_id(3)

    assert_nil result
  end

  def test_find_by_name
    ir = ItemRepository.new(@data)

    result = ir.find_by_name("thinger")

    assert_instance_of Item, result
    assert_equal "thinger", result.name
    assert_equal 1, result.id
  end

  def test_find_by_name_case_insensitive
    ir = ItemRepository.new(@data)

    result = ir.find_by_name("THINGER")

    assert_instance_of Item, result
    assert_equal "thinger", result.name
    assert_equal 1, result.id
  end

  def test_cant_find_by_name
    ir = ItemRepository.new(@data)

    result = ir.find_by_name("Zimbabwe")

    assert_nil result
  end

  def test_find_all_with_desc
    ir = ItemRepository.new(@data)

    result = ir.find_all_with_description("does")

    assert_instance_of Array, result
    assert_equal 2, result.count
  end

  def test_find_all_with_desc_case_insensitive
    ir = ItemRepository.new(@data)

    result = ir.find_all_with_description("DOES")

    assert_instance_of Array, result
    assert_equal 2, result.count
  end

  def test_find_all_with_desc_no_hits
    ir = ItemRepository.new(@data)

    result = ir.find_all_with_description("big bird")

    assert_empty result
  end

  def test_find_all_by_price
    ir = ItemRepository.new(@data)
    unit_price = BigDecimal.new(2500)

    result = ir.find_all_by_price(unit_price)

    assert_instance_of Array, result
    assert_equal 2, result.count
    assert_equal unit_price, result.first.unit_price
  end

  def test_does_not_find_all_by_price
    ir = ItemRepository.new(@data)
    unit_price = BigDecimal.new(2501)

    result = ir.find_all_by_price(unit_price)

    assert_empty result
  end

  def test_find_all_by_price_in_range
    ir = ItemRepository.new(@data)
    lower = BigDecimal.new(2499)
    upper = BigDecimal.new(2501)

    result = ir.find_all_by_price_in_range(lower, upper)

    assert_equal 2, result.count
    assert_equal 1, result.first.id
    assert_equal 2, result.last.id
  end

  def test_does_not_find_all_by_price_in_range
    ir = ItemRepository.new(@data)
    lower = BigDecimal.new(1000000000)
    upper = BigDecimal.new(2000000000)

    result = ir.find_all_by_price_in_range(lower, upper)

    assert_instance_of Array, result
    assert_empty result
  end

  def test_find_all_by_merchant_id
    ir = ItemRepository.new(@data)

    result = ir.find_all_by_merchant_id(4)

    assert_instance_of Array, result
    assert_equal 2, result.count
    assert_equal 1, result.first.id
    assert_equal 2, result.last.id
  end

  def test_cant_find_all_by_merchant_id
    ir = ItemRepository.new(@data)

    result = ir.find_all_by_merchant_id(0)

    assert_instance_of Array, result
    assert_empty result
  end

  def test_item_calls_parent_when_looking_for_merchant
    parent = Minitest::Mock.new
    ir = ItemRepository.new(@data, parent)
    id = ir.all.first.id
    parent.expect(:find_merchant_by_id, nil, [id])

    ir.find_merchant_by_id(id)

    parent.verify
  end
end
