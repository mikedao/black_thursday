require "bigdecimal"

class Item
  attr_reader   :id,
            :name,
            :description,
            :unit_price,
            :merchant_id,
            :created_at,
            :updated_at

  def initialize(data)
    @id           = data[:id].to_i
    @name         = data[:name]
    @description  = data[:description]
    @unit_price   = BigDecimal.new(data[:unit_price].to_i)
    @merchant_id  = data[:merchant_id].to_i
    @created_at   = Time.new(data[:created_at])
    @updated_at   = Time.new(data[:updated_at])
  end

  def unit_price_to_dollars
    @unit_price.to_f / 100
  end
end
