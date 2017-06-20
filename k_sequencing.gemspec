# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'k_sequencing'
  s.version       = '0.1.6'
  s.date          = '2017-05-24'
  s.summary       = 'KSequencing is a moderator service for your online content'
  s.description   = 'Moderation suite'
  s.post_install_message = File.read('INSTALL.md') if File.exist?('INSTALL.md')
  s.authors       = ['Jesdakorn Samittiauttakorn']
  s.email         = 'ton@nanameue.jp'
  s.files         = `git ls-files`.split("\n")
  s.homepage      = 'https://datawow.io'
  s.license       = 'Commercial'
  s.require_paths = ['lib']

  s.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.3'
  s.add_runtime_dependency 'activesupport', '~> 4.1', '>= 4.1'
  s.add_runtime_dependency 'faraday', '~> 0.9', '>= 0.9.2'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.10.0', '>= 0.10.0'
  s.add_runtime_dependency 'faraday_middleware-active_support_json', '~> 0.0.3', '>= 0.0.3'
end
