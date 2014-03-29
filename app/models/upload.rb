class Upload
  attr_accessor :file, :path, :spec

  def initialize(path)
    @path = path
    @file = File.open(path)
    @spec = Gem::Package.new(@file).spec
  end

  def store!

  end

end
