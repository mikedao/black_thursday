require "./test/test_helper"

class MerchantRepositoryTest < Minitest::Test

  def setup
    path = "./test/fixtures/merchants_fixture.csv"
    @data = FileIO.read_file(path)
  end

  def test_merchant_repo_can_be_created_with_data
    mr = MerchantRepository.new(@data)

    assert_instance_of MerchantRepository, mr
  end

  def test_merchant_repo_all_returns_all_merchant_objects
    mr = MerchantRepository.new(@data)

    assert mr.all.all? { |merchant| merchant.is_a?(Merchant) }
    assert_equal 10, mr.all.count
  end

  def test_merchant_repo_finds_by_id
    mr = MerchantRepository.new(@data)

    result = mr.find_by_id(12334113)

    assert_equal 12334113, result.id
    assert_equal "MiniatureBikez", result.name
    assert_instance_of Merchant, result
  end

  def test_merchant_repo_returns_nil_when_no_id_match
    mr = MerchantRepository.new(@data)

    result = mr.find_by_id(1)

    assert_nil result
  end

  def test_merchant_repo_finds_all_name
    mr = MerchantRepository.new(@data)

    result = mr.find_all_by_name("gold")

    assert_equal 2, result.count
    assert_instance_of Array, result
    assert_equal 12334135, result.first.id
    assert_equal 2, result.last.id
  end

  def test_merchant_repo_finds_all_name_empty_array
    mr = MerchantRepository.new(@data)

    result = mr.find_all_by_name("zzz")

    assert_instance_of Array, result
    assert result.empty?
  end
end
