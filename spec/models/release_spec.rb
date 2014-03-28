require 'spec_helper'

describe Release do
  it { should belong_to :rubygem }

  it { should validate_presence_of   :version }
  it { should validate_uniqueness_of :version }
end
