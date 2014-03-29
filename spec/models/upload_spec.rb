require 'spec_helper'

describe Upload do
  let!(:path)   { Rails.root.join 'spec/fixtures/mafia-0.1.4.gem' }
  let!(:upload) { Upload.new(path) }

  subject { upload }

  its(:file) { should be_a_kind_of File }
  its(:path) { should eq path }
  its(:spec) { should be_a_kind_of Gem::Specification }

  describe 'spec' do
    subject { upload.spec }

    its(:name)    { should eq 'mafia' }
    its(:version) { should eq Gem::Version.new('0.1.4') }
  end
end
