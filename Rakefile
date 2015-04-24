# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rainbow/ext/string'
require 'dotenv'
Dotenv.load

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'mlp'
  app.identifier = 'me.pachulski.mlp'

  app.development do
    app.codesign_certificate = ENV["DEVELOPMENT_CODESIGN_CERTIFICATE"]
    app.provisioning_profile = ENV["DEVELOPMENT_PROVISIONING_PROFILE"]
  end

  print_config(app)
end

def print_config(app)
  puts "app.identifier: " + app.identifier.underline
  puts "app.codesign_certificate: " + app.codesign_certificate.underline
  puts "app.provisioning_profile: " + app.provisioning_profile.underline
  puts
end
