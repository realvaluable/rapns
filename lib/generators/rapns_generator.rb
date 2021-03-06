class RapnsGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  class_option :skip_migrations, :type => :boolean, :default => false, :description => "Don't generate rapns migrations"

  def self.next_migration_number(path)
    @time ||= Time.now.utc
    @calls ||= -1
    @calls += 1
    (@time + @calls.seconds).strftime("%Y%m%d%H%M%S")
  end

  def copy_migration
    unless options.skip_migrations?
      add_rapns_migration('create_rapns_notifications')
      add_rapns_migration('create_rapns_feedback')
      add_rapns_migration('add_alert_is_json_to_rapns_notifications')
      add_rapns_migration('add_app_to_rapns')
      add_rapns_migration('create_rapns_apps')
      add_rapns_migration('add_gcm')
      add_rapns_migration('create_rapns_campaigns')
      add_rapns_migration('add_campaign_id_to_rapns_notifications')
      add_rapns_migration('add_sent_at_to_rapns_campaigns')
      add_rapns_migration('add_action_type_to_rapns_campaigns')
      add_rapns_migration('add_catalog_ids_to_rapns_campaigns')
      add_rapns_migration('rename_action_type_to_action_types_in_rapns_campaigns')
      add_rapns_migration('rename_action_types_to_action_type_ids_in_rapns_campaigns')
      add_rapns_migration('add_sound_and_data_to_rapns_campaigns')
      add_rapns_migration('add_removed_at_to_rapns_feedback')
      add_rapns_migration('add_deliver_after_to_rapns_campaigns')
    end
  end

  def copy_config
    copy_file 'rapns.rb', 'config/initializers/rapns.rb'
  end

  protected

  def add_rapns_migration(template)
    migration_dir = File.expand_path('db/migrate')

    if !self.class.migration_exists?(migration_dir, template)
      migration_template "#{template}.rb", "db/migrate/#{template}.rb"
    end
  end
end
