class AddWelcomeSectionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :welcome_section, :text
  end
end
