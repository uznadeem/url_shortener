class AddUserAgentBrowserOsToVisits < ActiveRecord::Migration[7.2]
  def change
    add_column :visits, :user_agent, :string, null: false
    add_column :visits, :browser, :string, null: false
    add_column :visits, :operating_system, :string, null: false
  end
end
