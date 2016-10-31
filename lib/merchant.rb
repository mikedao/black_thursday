class Merchant
  attr_reader :id,
              :name

  def id
  end

  def initialize(data)
    @id   = data[:id]
    @name = data[:name]
  end
end
