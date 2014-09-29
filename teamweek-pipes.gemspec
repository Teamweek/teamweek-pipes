# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamweek/pipes/version'

Gem::Specification.new do |spec|
  spec.name          = 'teamweek-pipes'
  spec.version       = Teamweek::Pipes::VERSION
  spec.authors       = ['Toggl OÜ']
  spec.email         = ['support@teamweek.com']
  spec.summary       = %q{Teamweek integrations.}
  spec.description   = 'Teamweek integrations'
  spec.homepage      = 'https://github.com/teamweek/teamweek-pipes'
  spec.license       = 'MIT'

  spec.files         = ['lib/teamweek-pipes.rb']
  spec.files        += Dir.glob('lib/teamweek/pipes/*.rb')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'teamweek-ruby'

  spec.add_development_dependency 'bundler', "~> 1.6"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
