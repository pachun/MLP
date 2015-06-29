# -*- coding: utf-8 -*-

# the following version number is duplicated in .travis.yml and README.md
$:.unshift("/Library/RubyMotion3.13/lib")
require "motion/project/template/ios"
require "motion-i18n"
require "sugarcube"

begin
  require "bundler"
  if ARGV.join(' ') =~ /archive/
    Bundler.require :default
  elsif ARGV.join(' ') =~ /spec/
    Bundler.require :default, :development, :spec
  else
    Bundler.require :default, :development
  end
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = "mlp"

  app.seed_id = "ARE387ZNXS"
  app.identifier = "me.pachulski.mlp"
  app.codesign_certificate = "iPhone Distribution: Nicholas Pachulski (ARE387ZNXS)"
  app.provisioning_profile = "./.apple/mlp_dist_pp.mobileprovision"
  app.entitlements["get-task-allow"] = false

  app.prerendered_icon = true
  app.icons = %w(
    iTunesArtwork@2x.png iTunesArtwork.png
    Icon-60@3x.png Icon-60@2x.png
    Icon-76@2x.png Icon-76.png
    Icon-Small-40@3x.png Icon-Small-40@2x.png Icon-Small-40.png
    Icon-Small@2x.png Icon-Small.png
  ).map do |icon_name|
    "icons/" + icon_name
  end

  silence_nondescript_warning(app)

  app.pods do
    pod "FXForms"
  end
end

# the following silences a warning which displays no details
# and whose significance nobody seems to understand
# silencing makes me queezy too, but here it is:
#   http://stackoverflow.com/questions/21150223/ld-warning-too-many-personality-routines-for-compact-unwind-to-encode
def silence_nondescript_warning(app)
  app.libs << "-Wl,-no_compact_unwind"
end
task :"build:simulator" => :"schema:build"
