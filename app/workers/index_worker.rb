class IndexWorker
  include SuckerPunch::Job

  def perform(path)
    Indexer.sync!(path)
  end
end
