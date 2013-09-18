Feature: Twitter
	Without authentication, got error

Scenario: Without authentication, got error 400
  When the client requests GET /statuses/mentions_timeline.json
  Then response should be "400"
  And response should be JSON:
   """
  { "errors": [{"message": "Bad Authentication data", "code": 215}] }
  """
  And the JSON response should be have "errors" element
