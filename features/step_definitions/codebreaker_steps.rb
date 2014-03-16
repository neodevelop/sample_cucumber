Given(/^I am viewing "(.*?)"$/) do |url|
  visit url
end

Then(/^I should see "(.*?)"$/) do |message|
  last_response.body.should =~ /#{message}/
end

Then(/^I should be prepared to enter a number$/) do
  response.should have_selector "#guess_number"
end

When(/^I fill with the code (\d+)$/) do |guess_number|
  fill_in "guess_number", :with =>  guess_number
end

When(/^click "(.*?)"$/) do |button|
  click_button button
end
