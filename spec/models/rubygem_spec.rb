require 'spec_helper'

describe Rubygem do
  it { should have_many :releases }

  it { should validate_presence_of   :name }
  it { should validate_uniqueness_of :name }
end
