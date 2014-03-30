require 'spec_helper'

describe RequiredEnv do

  describe 'set?' do
    it 'true' do
      expect(RequiredEnv.set?).to be_true
    end

    it 'false' do
      stub_const('ENV', {})
      expect(RequiredEnv.set?).to be_false
    end
  end

  describe 'missing' do
    it 'false' do
      expect(RequiredEnv.missing).to eq []
    end

    it 'true' do
      stub_const('ENV', {})
      expect(RequiredEnv.missing).to eq RequiredEnv::VARIABLES
    end
  end
end
