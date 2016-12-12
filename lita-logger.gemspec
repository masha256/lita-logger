Gem::Specification.new do |spec|
  spec.name          = "lita-logger"
  spec.version       = "1.0.1"
  spec.authors       = ["Mike Machado"]
  spec.email         = ["mike@machadolab.com"]
  spec.description   = %q{A Lita handler to log all chat messages to a file}
  spec.summary       = %q{A Lita handler to log all chat messages to a file}
  spec.homepage      = "https://github.com/machadolab/lita-logger"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
