# Setup comes from https://learnrubythehardway.org/book/ex46.html

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'HealthIQ'
  spec.version       = '1.0'
  spec.authors       = ['Brent E. Edwards']
  spec.email         = ['inupihc@tsacmoc.ten'] # Reverse each element
  spec.summary       = 'Sample project for HealthIQ'
  spec.description   = 'Design a simulator for daily blood sugar.'
  spec.homepage      = 'http://healthiq.com/'
  spec.license       = 'MIT'

  spec.files         = ['lib/health_iq.rb']
  spec.executables   = ['bin/HealthIQ']
  spec.test_files    = ['tests/test_healthiq.rb']
  spec.require_paths = ['lib']
end
