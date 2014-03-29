class Release < ActiveRecord::Base
  belongs_to :rubygem

  serialize :authors
  serialize :email
  serialize :dependencies

  validates :version, presence: true, uniqueness: { scope: :rubygem_id }
end
