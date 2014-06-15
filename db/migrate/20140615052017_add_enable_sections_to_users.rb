class AddEnableSectionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :enable_about_section, :boolean, :default => true
    add_column :users, :enable_education_section, :boolean, :default => true
    add_column :users, :enable_experience_section, :boolean, :default => true
    add_column :users, :enable_projects_section, :boolean, :default => true
    add_column :users, :enable_skills_section, :boolean, :default => true
  end
end
