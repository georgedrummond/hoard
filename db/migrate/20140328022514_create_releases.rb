class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.belongs_to :rubygem
      t.string :version
      t.timestamps
    end
  end
end
