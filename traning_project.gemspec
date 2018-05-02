
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "traning_project/version"

Gem::Specification.new do |spec|
  spec.name          = "traning_project"
  spec.version       = TraningProject::VERSION
  spec.authors       = ["tsyhanko"]
  spec.email         = ["tsyhanko@fidor.com"]

  spec.summary       = 'Test'
  spec.description   = 'Automation'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "allure-rspec"
  spec.add_development_dependency "json"
  spec.add_development_dependency "require_all"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "u2f"
  spec.add_development_dependency "parallel"
  spec.add_development_dependency 'waitutil', '~> 0.2.1'
  spec.add_development_dependency 'nikkou'
  spec.add_development_dependency 'celluloid'
  spec.add_development_dependency 'celluloid-pmap'
  spec.add_development_dependency 'parallel_tests'
  spec.add_development_dependency 'retries'
  spec.add_development_dependency 'concurrent-ruby'
  spec.add_development_dependency 'progress_bar'
  spec.add_development_dependency 'process_shared'
  spec.add_development_dependency 'jira-ruby'
  spec.add_development_dependency 'json_refs'
  spec.add_development_dependency 'json-schema'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pdf-reader'
  spec.add_development_dependency 'docker-api'
  spec.add_development_dependency 'time_difference'
  spec.add_development_dependency 'net-ssh-gateway'
  spec.add_development_dependency 'selenium-webdriver'
end
