require 'httpclient'
clnt = HTTPClient.new()
When /^the client requests GET (.*)$/ do |path|
#  get(path)
@result = clnt.get("https://api.twitter.com/1.1" + path)
@json = @result.content
end

Then /^response should be JSON:$/ do |json|
	JSON.parse(@json).should == JSON.parse(json)
end

Then /^response should be "([^"]*)"$/ do |status|
#	p @result.header
    @result.header.status_code.should == status.to_i
end

Then /^the JSON response should be an array with (\d+) "([^"]*)" elements$/ do |num, name|
                                                            page = JSON.parse(@json)
                                                            page.map { |d| d[name] }.length.should == num.to_i
                                                          end

Then /^the JSON response should be have "([^"]*)" element$/ do |arg1|
    page = JSON.parse(@json)
	page[arg1].length.should >= 1
end

