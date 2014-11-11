require 'spec_helper'

describe 'Example nr 1' do
    attr_reader :selenium_driver
  before(:all) do
      @driver = Selenium::WebDriver.for :firefox
      @driver.manage.window.maximize
      @driver.navigate.to 'http://amazon.co.uk'
  end

  after(:all) do
      @driver.quit
  end

   it 'buy iphon5 and iphone6 and check if they are in cart' do
    expect(@driver.title).to eql('Amazon.co.uk: Low Prices in Electronics, Books, Sports Equipment & more')
    searchBox = @driver.find_element(:id ,'twotabsearchtextbox')
    searchBox.send_keys 'Iphone 5'
    searchBox.submit
    sleep(5)

    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:link_text, 'Apple iPhone 5, White, 16GB').displayed? }

    @driver.find_element(:link_text, 'Apple iPhone 5, White, 16GB').click
    sleep (5)

    @driver.find_element(:id, 'bb_atc_button').click
    sleep (5)

    searchBox = @driver.find_element(:id ,'twotabsearchtextbox')
    searchBox.send_keys 'Iphone 6'
    searchBox.submit
    sleep(5)

    @driver.find_element(:partial_link_text, 'Apple iPhone 6').click
    sleep(5)

    @driver.find_element(:id, 'bb_atc_button').click
    sleep (5)

    @driver.find_element(:id, 'nav-cart').click
    sleep (5)

    kupioneRzeczy = @driver.find_elements(:css, 'span.sc-product-title')

    kupioneRzeczy.any? {|item| ['Apple iPhone 5','Apple iPhone 6'].include?(item.text)}
  end

end
