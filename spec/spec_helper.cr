require "spec"
require "../src/lucky"
require "../tasks/**"
require "./support/**"

Lucky::AssetHelpers.load_manifest

Spec.before_each do
  ARGV.clear
end

Lucky::Session.configure do |settings|
  settings.key = "_app_session"
end

Lucky::Server.configure do |settings|
  settings.secret_key_base = Random::Secure.base64(32)
  settings.host = "0.0.0.0"
  settings.port = 8080
end

Lucky::RouteHelper.configure do |settings|
  settings.base_uri = "luckyframework.org"
end

LuckyRecord::Repo.configure do |settings|
  settings.url = "Not used yet"
end

Lucky::ErrorHandler.configure do |settings|
  settings.show_debug_output = false
end

Lucky::LogHandler.configure do |settings|
  settings.show_timestamps = false
end

Lucky::StaticFileHandler.configure do |settings|
  settings.hide_from_logs = true
end

Habitat.raise_if_missing_settings!
