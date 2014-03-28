class Release < ActiveRecord::Base
  belongs_to :rubygem

  validates :version, presence: true
end
