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
    assert_equal 10, ir.all.count
  end


end
