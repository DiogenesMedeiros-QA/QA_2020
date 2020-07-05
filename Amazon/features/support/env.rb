require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'site_prism'
require 'report_builder'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

BROWSER = ENV['BROWSER']

# Config staus report
ReportBuilder.configure do |config|
    config.input_path = 'results/cucumber_json'
    config.report_path = 'status_report'
    config.report_types = [:retry, :html]
    config.report_title = 'Test Results Amazon Ecommerce'
    config.additional_info = {browser: 'Chrome', environment: 'PRD'}
  end

# Config driver and host default
Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://www.amazon.com.br/'
    config.default_max_wait_time = 5
  end

# Config registers drivers
#
Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('chrome')
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    elsif BROWSER.eql?('chrome_headless')
      Capybara::Selenium::Driver.new(app, :browser => :chrome_headless,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
          'chromeOptions'=> { 'args' => ['--headless', 
                                        'disable-gpu',
                                        '--disable-dev-shm-usage',
                                        '--no-sandbox'] }
        )  
      )
    end
  end