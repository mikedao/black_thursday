require "bigdecimal"

class Item
  attr_reader   :name,
            :description,
            :unit_price,
            :created_at,
            :updated_at

  def initialize(data)
    @name         = data[:name]
    @description  = data[:description]
    @unit_price   = BigDecimal.new(data[:unit_price].to_i)
    @created_at   = Time.new(data[:created_at])
    @updated_at   = Time.new(data[:updated_at])
  end
end
