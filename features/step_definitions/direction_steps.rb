When /^I get driving directions$/ do
  @routes = @origin.drive_to(@destinations)
end

Then /^I should get a list of possible routes$/ do
  assert !@routes.found?
end

Then /^the first route should have (a\s)?"(.*)"$/ do |a, attribute|
  assert_not_nil @routes[0].send(attribute)
end

Then /^the first route should have a list of "([^\"]*)"$/ do |set|
  assert_instance_of Array, @routes[0].send(set)
  assert !@routes[0].send(set).empty?
end


Then /^I should get "([^\"]*)" routing error$/ do |error_qty|
  assert_equal error_qty.to_i, @routes.errors.size
end

Then /^the first routing error should read "([^\"]*)"$/ do |error_message|
  assert !@routes.errors[0].nil?
  assert_match /#{Regexp.escape(error_message)}/i, @routes.errors[0]
end

