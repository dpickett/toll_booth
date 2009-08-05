Given /^I'm starting at "([^\"]*)"$/ do |location|
  @origin = TollBooth::Location.new(location)
end

Given /^I want to go to "([^\"]*)"$/ do |location|
  @destinations ||= []
  @destinations << TollBooth::Location.new(location)
end

