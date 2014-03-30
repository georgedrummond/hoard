require 'spec_helper'

describe RequiredEnv do

  describe 'set?' do
    it 'true' do
      expect(RequiredEnv.set?).to be_true
    end

    it 'false' do
      ENV['GITHUB_API_SECRET'] = nil
      expect(RequiredEnv.set?).to be_false
    end
  end

  describe 'missing' do
    it 'false' do
      expect(RequiredEnv.missing).to eq []
    end

    it 'true' do
      ENV['GITHUB_API_SECRET'] = nil
      expect(RequiredEnv.missing).to eq ['GITHUB_API_SECRET']
    end
  end
end
