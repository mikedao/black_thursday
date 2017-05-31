require "./lib/merchant"

class MerchantRepository
  def initialize(data)
    @merchants = []
    create_merchants(data)
  end

  def all
    @merchants
  end

  def find_by_id(id)
    @merchants.find do |merchant|
      merchant.id == id
    end
  end

  def find_all_by_name(fragment)
    @merchants.find_all do |merchant|
      merchant.name.downcase.include?(fragment.downcase)
    end
  end

  private

  def create_merchants(data)
    data.each do |row|
      @merchants << Merchant.new(row)
    end
  end
end
