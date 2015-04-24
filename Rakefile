# -*- coding: utf-8 -*-

# the following version number is duplicated in .travis.yml and README.md
$:.unshift("/Library/RubyMotion3.10/lib")
require "motion/project/template/ios"
require "motion-i18n"

begin
  require "bundler"
  Bundler.require
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

  silence_nondescript_warning(app)
end

# the following silences a warning which displays no details
# and whose significance nobody seems to understand
# silencing makes me queezy too, but here it is:
#   http://stackoverflow.com/questions/21150223/ld-warning-too-many-personality-routines-for-compact-unwind-to-encode
def silence_nondescript_warning(app)
  app.libs << "-Wl,-no_compact_unwind"
end
