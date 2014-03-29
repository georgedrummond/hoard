require 'spec_helper'

describe SessionsController do

  describe '#new' do
    before { get :new }

    it { should render_template('new') }
    it { should respond_with(:success) }
  end

  describe '#create' do
    before { request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github] }

    context 'in organization' do
      before do
        VCR.use_cassette('github/organization_valid') do
          get :create
        end
      end

      it { should redirect_to rubygems_path }
    end

    context 'not in organization' do
      before do
        VCR.use_cassette('github/organization_invalid') do
          get :create
        end
      end

      it { should redirect_to login_path }
    end
  end

end
