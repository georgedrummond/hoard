class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :name
      t.string :avatar_url
      t.string :github_id
      t.string :github_token
      t.timestamps
    end
  end
end
