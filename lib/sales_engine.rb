require "./lib/file_io"
require "./lib/item_repository"
require "./lib/merchant_repository"

class SalesEngine
  attr_reader   :items,
            :merchants

  def initialize(path_hash)
    items_path      = path_hash[:items]
    merchants_path  = path_hash[:merchants]

    @items = ItemRepository.new(FileIO.read_file(items_path))
    @merchants = MerchantRepository.new(FileIO.read_file(merchants_path))
  end

  def self.from_csv(path_hash)
    new(path_hash)
  end

  def find_items_by_merchant_id(id)
    items.find_all_by_merchant_id(id)
  end

  def find_merchant_by_id(id)
    merchants.find_by_id(id)
  end


end
