require "./lib/file_io"
require "./lib/item_repository"
require "./lib/merchant_repository"

class SalesEngine
  attr_reader   :item_repo,
            :merchant_repo

  def initialize(path_hash)
    items_path      = path_hash[:items]
    merchants_path  = path_hash[:merchants]

    @item_repo = ItemRepository.new(FileIO.read_file(items_path))
    @merchant_repo = MerchantRepository.new(FileIO.read_file(merchants_path))
  end

  def self.from_csv(path_hash)
    new(path_hash)
  end



end
