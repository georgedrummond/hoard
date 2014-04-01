class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.belongs_to :rubygem
      t.string   :name
      t.string   :version
      t.text     :description
      t.text     :summary
      t.string   :platform
      t.date     :date
      t.boolean  :prerelease
      t.string   :number
      t.string   :authors
      t.string   :email
      t.string   :dependencies
      t.boolean  :latest
      t.timestamps
    end
  end
end
