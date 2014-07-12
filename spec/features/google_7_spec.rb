require 'spec_helper'

feature("On Google startpage") do
  scenario("user searches for Cheese") do
    visit 'http://www.google.com'
    fill_in 'q', :with => 'Cheese!' 
    find(:xpath, "//*[@name='btnG']").click()
    using_wait_time 10 do
      expect(page).to have_title('Cheese!')
    sleep 1
    end
  end
end
