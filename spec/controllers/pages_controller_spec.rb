require 'spec_helper'

describe PagesController do
  describe '#setup' do
    context 'true' do
      before { get :setup }
      it { should redirect_to rubygems_path }
    end

    context 'false' do
      before do
        stub_const('ENV', {})
        get :setup
      end

      it { should render_template(:setup) }
    end
  end
end
