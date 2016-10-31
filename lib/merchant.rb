class Merchant
  attr_reader :id,
              :name



  def initialize(data)
    @id_name   = data[:id]
    @data_name = data[:name]
  end
end
