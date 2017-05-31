require "CSV"

class FileIO

  def self.read_file(path)
     CSV.open(path, headers: true, header_converters: :symbol)
  end



end
