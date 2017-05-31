require "./lib/item"

class ItemRepository
  def initialize(data)
    @items = []
    create_items(data)
  end

  def all
    @items
  end

  private

  def create_items(data)
    data.each do |row|
      @items << Item.new(row)
    end
  end
end
