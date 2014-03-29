require 'spec_helper'

describe SessionsController do

  describe '#new' do
    before { get :new }

    it { should render_template('new') }
    it { should respond_with(:success) }
  end

end
