# frozen_string_literal: true

# Don't build a dummy app with solidus_bolt enabled
ENV["SKIP_SOLIDUS_BOLT"] = "true"

require "bundler/gem_tasks"

require "solidus_dev_support/rake_tasks"
SolidusDevSupport::RakeTasks.install(user_class: "Spree::User")

task default: "extension:specs"
