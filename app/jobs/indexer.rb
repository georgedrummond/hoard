class Indexer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def sync! ; end
end
