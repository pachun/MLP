# -*- coding: utf-8 -*-

# the following version number is duplicated in .travis.yml and README.md
$:.unshift("/Library/RubyMotion3.10/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'mlp'
end
