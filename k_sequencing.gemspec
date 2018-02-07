lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'k_sequencing'
  s.version       = '0.1.24'
  s.date          = '2017-12-27'
  s.summary       = 'KSequencing is a moderator service for your online content'
  s.description   = 'Moderation suite'
  s.post_install_message = File.read('INSTALL.md') if File.exist?('INSTALL.md')
  s.authors       = ['Jesdakorn Samittiauttakorn']
  s.email         = 'ton@nanameue.jp'
  s.files         = `git ls-files`.split("\n")
  s.homepage      = 'https://datawow.io'
  s.license       = 'Commercial'
  s.require_paths = ['lib']

  s.add_runtime_dependency 'faraday',            '~> 0.13.1', '>= 0.13.1'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.12.2', '>= 0.12.2'
  s.add_runtime_dependency 'json',               '~> 1.8',    '>= 1.8.3'
  s.add_development_dependency 'minitest',       '~> 5.11', '>= 5.11.3'
  s.add_development_dependency 'rake',           '~> 12.3'
  s.add_development_dependency 'simplecov',      '~> 0.15.1'
  s.add_development_dependency 'webmock',        '~> 3.3'
end
