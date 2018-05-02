require "bundler/setup"
require "traning_project"
require 'active_record'
require 'rubygems'
require 'allure-rspec'
require 'allure-rspec/adaptor'
require 'require_all'
require 'yaml'
require 'net/ssh/gateway'
require 'pathname'
require 'waitutil'
require 'logger'
require 'celluloid/current'
require 'celluloid/pmap'
require 'rest-client'
require 'retries'
require 'parallel_tests'
require 'process_shared'
require 'jira-ruby'
require 'pdf-reader'
require 'selenium-webdriver'

include AllureRubyAdaptorApi
RSpec.configure do |config|

  config.include AllureRSpec::Adaptor
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do |test|
    test.metadata[:story] = 'my own story'
  end

  config.after(:each) do |test|
    test.metadata[:story]
  end




  AllureRSpec.configure do |c|
    c.output_dir = '/Users/mykhailo_tsyhanko/RubymineProjects/traning_project/gen/allure-results'
    c.clean_dir = true # clean the output directory first? (default: true)
    c.logging_level = Logger::ERROR # logging level (default: DEBUG)
  end
end
