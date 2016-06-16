# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |s|
  s.name          = 'slack-reporter'
  s.version       = SlackReporter::VERSION
  s.date          = '2016-06-13'
  s.summary       = "A slack webhooks wrapper"
  s.description   = "A very simple wrapper for a a simple wrapper for posting to slack channels"
  s.authors       = ["Vasilis Spilka"]
  s.email         = 'vasspilka@gmail.com'
  s.files         = %w(lib/slack-reporter.rb lib/version.rb README.md CHANGELOG.md)
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/vasspilka/slack-reporter'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.2.0'

  s.add_dependency 'slack-notifier'
end
