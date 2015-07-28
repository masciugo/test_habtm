class ProjectsUsers < ActiveRecord::Migration
  def change
    create_join_table :projects, :users
  end
end
