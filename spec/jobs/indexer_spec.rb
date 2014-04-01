require 'spec_helper'

describe Indexer do
  it 'manages indexing'

  describe 'self.sync!' do
    it do
      indexer = double('Indexer')
      Indexer.should_receive(:new).once.and_return(indexer)
      indexer.should_receive(:sync!).once.and_return(true)
      Indexer.sync!
    end
  end

  describe 'sync!' do
    it 'runs upload sync 3 times' do
      indexer = Indexer.new
      indexer.should_receive(:upload)
              .with(anything, anything)
              .exactly(3).times
              .and_return(true)

      indexer.sync!
    end
  end
end
