# frozen_string_literal: true

require "spec_helper"
require "rails/generators"
require "generators/solidus/auth/install/install_generator"

RSpec.describe Solidus::Auth::Generators::InstallGenerator do
  let(:destination) { Dir.mktmpdir }
  let(:rake_commands) { [] }

  after { FileUtils.rm_rf(destination) }

  def run_generator(*args)
    generator = described_class.new([], args, destination_root: destination)
    allow(generator).to receive(:rake) { |command| rake_commands << command }
    generator.invoke_all
  end

  context "with admin credentials and migrations enabled" do
    it "creates the admin user after migrating" do
      run_generator("--auto-run-migrations", "--admin-email=owner@store.test", "--admin-password=s3cret-pass")

      expect(rake_commands).to eq([
        "railties:install:migrations FROM=solidus_auth",
        "db:migrate",
        "spree_auth:admin:create ADMIN_EMAIL=owner@store.test ADMIN_PASSWORD=s3cret-pass"
      ])
    end
  end

  context "with only an admin password" do
    it "passes just that variable" do
      run_generator("--auto-run-migrations", "--admin-password=s3cret-pass")

      expect(rake_commands.last).to eq("spree_auth:admin:create ADMIN_PASSWORD=s3cret-pass")
    end
  end

  context "without admin credentials" do
    it "does not create an admin user" do
      run_generator("--auto-run-migrations")

      expect(rake_commands).to eq([
        "railties:install:migrations FROM=solidus_auth",
        "db:migrate"
      ])
    end
  end

  context "with admin credentials but skipped migrations" do
    it "does not create an admin user" do
      run_generator("--skip-migrations", "--admin-email=owner@store.test", "--admin-password=s3cret-pass")

      expect(rake_commands).to eq(["railties:install:migrations FROM=solidus_auth"])
    end
  end
end
