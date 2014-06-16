class AddEnableWelcomeSectionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :enable_welcome_section, :boolean, :default => true
  end
end
