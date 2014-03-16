Given(/^I am viewing "(.*?)"$/) do |url|
  visit url
end

Then(/^I should see "(.*?)"$/) do |message|
  last_response.body.should =~ /#{message}/
end

Then(/^I should be prepared to enter a number$/) do
  response.should have_selector "#guess_number"
end
