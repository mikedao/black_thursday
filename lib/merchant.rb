class Merchant
  attr_reader   :id,
            :name

  def initialize(data, parent = nil)
    @parent = parent
    @id     = data[:id].to_i
    @name   = data[:name]
  end

  def items
    @parent.find_items_by_merchant_id(self.id)
  end
end
