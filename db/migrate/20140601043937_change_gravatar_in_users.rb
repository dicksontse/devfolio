class ChangeGravatarInUsers < ActiveRecord::Migration
  def change
    change_column :users, :gravatar, :boolean, :default => true
  end
end
