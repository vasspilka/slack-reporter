# coding: utf-8

Gem::Specification.new do |s|
  s.name          = 'slack-reporter'
  s.version       = '0.1.0'
  s.date          = '2016-06-13'
  s.summary       = "A slack webhooks wrapper"
  s.description   = "A very simple wrapper for a a simple wrapper for posting to slack channels"
  s.authors       = ["Vasilis Spilka"]
  s.email         = 'vasspilka@gmail.com'
  s.files         = 'git ls-files -- lib/* README.md CHANGELOG.md'.split($/)
  s.require_paths = ['lib']
  s.homepage      = 'http://rubygems.org/gems/reportier'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.2.0'

  s.add_dependency 'slack-notifier'
end
