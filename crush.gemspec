require_relative './lib/crush'

Gem::Specification.new do |s|
  s.name        = 'crush'
  s.version     = Crush::VERSION
  s.executables << 'crush'
  s.date        = '2010-08-01'
  s.summary     = "Crush"
  s.description = "A simple, self-contained, serverless, zero-configuration, json document store."
  s.authors     = ["Vijay Parikh"]
  s.email       = 'vijay.parikh@gmail.com'
  #s.files       = ["lib/crush.rb"]
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.md crush.gemspec)
  s.homepage    = 'https://github.com/vijayparikh/crush'
  s.license     = 'MIT'

  s.add_runtime_dependency "cmdparse"
end