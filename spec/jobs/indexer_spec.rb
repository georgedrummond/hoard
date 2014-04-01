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

  let!(:indexer) { Indexer.new }

  describe 'sync!' do
    it 'runs upload sync 3 times' do
      indexer.should_receive(:upload)
              .with(anything, anything)
              .exactly(3).times
              .and_return(true)

      indexer.sync!
    end
  end

  describe 'specs_index' do
    it do
      Release.should_receive(:all).once.and_return([])
      indexer.specs_index
    end
  end

  describe 'latest_specs_index' do
    it do
      Release.should_receive(:latest).once.and_return([])
      indexer.latest_specs_index
    end
  end

  describe 'prerelease_specs_index' do
    it do
      Release.should_receive(:prerelease).once.and_return([])
      indexer.prerelease_specs_index
    end
  end
end
