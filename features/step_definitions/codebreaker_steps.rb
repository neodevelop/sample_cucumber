Given(/^I am viewing "(.*?)"$/) do |url|
  visit url
end

Then(/^I should see "(.*?)"$/) do |message|
  last_response.body.should =~ /#{message}/
end
