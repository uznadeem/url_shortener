class CreateRedirections < ActiveRecord::Migration[7.2]
  def change
    create_table :redirections do |t|
      t.string :url_address, null: false
      t.string :alias, null: false

      t.timestamps
    end

    add_index :redirections, :alias, unique: true
  end
end
