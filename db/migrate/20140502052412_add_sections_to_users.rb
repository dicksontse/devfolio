class AddSectionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about_section, :text
    add_column :users, :education_section, :text
    add_column :users, :experience_section, :text
    add_column :users, :projects_section, :text
    add_column :users, :skills_section, :text
  end
end
