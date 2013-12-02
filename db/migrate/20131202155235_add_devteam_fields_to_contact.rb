class AddDevteamFieldsToContact < ActiveRecord::Migration
  def change
    add_column :contact_requests, :test_suite, :boolean
    add_column :contact_requests, :ci_server, :boolean
    add_column :contact_requests, :deploy_master, :boolean
    add_column :contact_requests, :onestep_deploy, :boolean
    add_column :contact_requests, :bugs_not_issue, :boolean
    add_column :contact_requests, :releases_not_issue, :boolean
    add_column :contact_requests, :infrastructure_not_issue, :boolean
    add_column :contact_requests, :agile_product, :boolean
    add_column :contact_requests, :week_sprints, :boolean
    add_column :contact_requests, :weekly_retros, :boolean
    add_column :contact_requests, :analytics, :boolean
  end
end

