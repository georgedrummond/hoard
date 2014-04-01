class Indexer
  attr_accessor :path

  def self.sync!
    new.sync!
  end

  def sync!
    upload "specs.4.8.gz",            spec_file(specs_index)
    upload "latest_specs.4.8.gz",     spec_file(latest_specs_index)
    upload "prerelease_specs.4.8.gz", spec_file(prerelease_specs_index)
  end

  def upload(path, data)
    puts path
    puts data
  end

  def specs_index
    Release.all
  end

  def latest_specs_index
    specs_index.where(latest: true)
  end

  def prerelease_specs_index
    specs_index.where(prerelease: true)
  end

  def spec_file(specs)
    processed_specs = specs.to_a.collect {|v| [v.name, v.number, v.platform]}
    stringify minimized_specs(processed_specs)
  end

  # Taken from rubygems.org to create a gzipped 
  # and marshaled spec index
  def stringify(specs)
    final = StringIO.new
    gzip = Zlib::GzipWriter.new(final)
    gzip.write(Marshal.dump(specs))
    gzip.close

    final.string
  end

  # This method is taken from rubygems.org
  # and it is used to map the array of versions
  # to shared objects in order to minimize the
  # final specs index size
  def minimized_specs(specs)
    names     = Hash.new { |h,k| h[k] = k }
    versions  = Hash.new { |h,k| h[k] = Gem::Version.new(k) }
    platforms = Hash.new { |h,k| h[k] = k }

    specs.each do |row|
      row[0] = names[row[0]]
      row[1] = versions[row[1].strip]
      row[2] = platforms[row[2]]
    end

    specs
  end
end
