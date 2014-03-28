class Rubygem < ActiveRecord::Base
  has_many :releases

  validates :name, presence: true, uniqueness: true
end
