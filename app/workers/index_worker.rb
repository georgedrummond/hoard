class IndexWorker
  include Sidekiq::Worker

  def perform(path)
    Indexer.sync!(path)
  end
end
