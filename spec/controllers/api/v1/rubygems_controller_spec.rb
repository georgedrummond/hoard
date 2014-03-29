require 'spec_helper'

describe Api::V1::RubygemsController do
  let!(:gem_package) { 'mafia-0.1.4.gem' }
  let!(:file)        { fixture_file_upload gem_package, 'mafia-0.1.4.gem' }

  it 'has authentication'

  describe '#create' do
    context 'success' do
      before do
        Upload.any_instance.stub(:store!).and_return(true)
        post :create, file: file
      end

      it { should respond_with(:created) }
    end

    context 'failure' do
      before do
        Upload.any_instance.stub(:store!).and_return(false)
        post :create, file: file
      end

      it { should respond_with(:conflict) }
    end
  end
end
