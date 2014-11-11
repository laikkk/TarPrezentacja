require 'spec_helper'

describe 'Example' do
  attr_reader :selenium_driver

  okruczekUrl = 'http://okruszek.org.pl/'

  before(:all) do
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  after(:all) do
    @driver.quit
  end

  it 'Click on okruszek.org.pl/' do
    @driver.navigate.to okruczekUrl
    chlebImg = @driver.find_element(:css ,'div.chleb a')
    chlebImg.click
    @wait.until { @driver.find_element(:css ,'img[src="images/dziekujemy.gif"]').displayed? }
    expect(@driver.find_element(:css ,'img[src="images/dziekujemy.gif"]').displayed?).to be true
  end

end
