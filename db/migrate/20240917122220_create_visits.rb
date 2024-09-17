class CreateVisits < ActiveRecord::Migration[7.2]
  def change
    create_table :visits do |t|
      t.string :ip_address, null: false
      t.references :redirection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
