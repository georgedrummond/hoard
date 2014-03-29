require 'spec_helper'

describe 'Login' do
  describe 'success' do
    before do
      VCR.use_cassette('github/organization_valid') do
        visit root_path
        click_on 'Login with GitHub'
      end
    end

    it { expect(page.current_path).to eq rubygems_path }
  end
end
