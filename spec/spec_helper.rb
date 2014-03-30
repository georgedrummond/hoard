require 'simplecov'

if ENV['CI']
  require 'codeclimate-test-reporter'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    Coveralls::SimpleCov::Formatter,
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end

SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'vcr'

ENV['GITHUB_ORGANIZATION_ID'] = 'rentify'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:github, {
  uid: '12345',
  info: {
    nickname: 'georgedrummond',
    name: 'George Drummond',
    email: 'georgedrummond@gmail.com',
    avatar_url: 'https://avatars.githubusercontent.com/u/34163?'
  },
  credentials: {
    token: '12345'
  }
})

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.order = 'random'

  config.after(:suite) do
    WebMock.disable!
  end
end
