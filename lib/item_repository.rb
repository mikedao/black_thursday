require "./lib/item"

class ItemRepository
  def initialize(data, parent = nil)
    @parent = parent
    @items  = []
    create_items(data)
  end

  def all
    @items
  end

  def find_by_id(id)
    @items.find do |item|
      item.id == id
    end
  end

  def find_by_name(name)
    @items.find do |item|
      item.name.downcase == name.downcase
    end
  end

  def find_all_with_description(fragment)
    @items.find_all do |item|
      item.description.downcase.include?(fragment.downcase)
    end
  end

  def find_all_by_price(unit_price)
    @items.find_all do |item|
      item.unit_price == unit_price
    end
  end

  def find_all_by_price_in_range(lower, upper)
    @items.find_all do |item|
      item_price_in_range?(lower, upper, item.unit_price)
    end
  end

  def find_all_by_merchant_id(merchant_id)
    @items.find_all do |item|
      item.merchant_id == merchant_id
    end
  end

  def find_merchant_by_id(id)
    @parent.find_merchant_by_id(id)
  end

  private

  def create_items(data)
    data.each do |row|
      @items << Item.new(row)
    end
  end

  def item_price_in_range?(lower, upper, price)
    price > lower && price < upper
  end
end
