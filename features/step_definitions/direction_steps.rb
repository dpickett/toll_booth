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

