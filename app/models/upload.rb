class Upload
  attr_accessor :file, :path, :spec, :rubygem, :release

  def initialize(path)
    @path = path
    @file = File.open(path)
    @spec = Gem::Package.new(@file).spec
  end

  def store!
    build_release

    if release.save
      IndexWorker.perform_async(path)
    else
      false
    end
  end

  private

  def build_release
    @rubygem = Rubygem.find_or_create_by(name: spec.name)
    @release = rubygem.releases.build(
      name:         spec.name,
      version:      spec.version.to_s,
      description:  spec.description,
      summary:      spec.summary,
      platform:     spec.platform,
      date:         spec.date,
      prerelease:   spec.version.prerelease?,
      number:       spec.version.to_s,
      authors:      spec.authors,
      email:        spec.email,
      dependencies: spec.dependencies.collect {|g| [g.name, g.requirement.to_s]}
    )
  end
end
