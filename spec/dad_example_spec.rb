require 'spec_helper'

describe 'Example' do
  attr_reader :selenium_driver

  dadUrl = 'http://html5demos.com/drag'
  selectMultipleUrl = 'http://www.w3schools.com/tags/tryit.asp?filename=tryhtml_select_multiple'

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize
  end

  after(:all) do
    @driver.quit
  end

  it 'Drag and drop' do
    @driver.navigate.to dadUrl
    imgElement = @driver.find_element(:id ,'one')
    container =  @driver.find_element(:id ,'bin')
    @driver.action.click_and_hold(imgElement)
      .move_to(container)
      .release(container)
      .perform
  end

  it 'Select multiple' do
    @driver.navigate.to selectMultipleUrl
    @driver.switch_to.frame 'iframeResult'
    volvoElement = @driver.find_element(:css, 'option[value="volvo"]')
    opelElement = @driver.find_element(:css, 'option[value="opel"]')
    submitElement = @driver.find_element(:css, 'input[type="submit"]')

    @driver.action.click(volvoElement)
      .key_down(:shift)
      .click(opelElement)
      .perform

    sleep 1
    submitElement.click
    @driver.switch_to.default_content
    sleep 5
  end



end
