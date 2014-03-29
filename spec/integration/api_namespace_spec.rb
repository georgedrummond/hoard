require 'spec_helper'

describe Api::V1 do
  it 'namespace inherits from Api::BaseController' do
    pending
    
    Api.constants.each do |constant|
      next if constant == :BaseController || !Api.const_get(constant).is_a?(Class)
      expect(Api.const_get(constant).superclass).to eq Api::BaseController
    end
  end
end
