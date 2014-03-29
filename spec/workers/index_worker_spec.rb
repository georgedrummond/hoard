require 'spec_helper'

describe IndexWorker do

  describe '.perform_async' do
    it 'calls indexer' do
      Indexer.should_receive(:sync!).with('abc').once.and_return(true)
      IndexWorker.new.perform('abc')
    end
  end

end
