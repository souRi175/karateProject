Feature: Testing Petstore API

Background:
  # This is where you can define common configurations or variables used across scenarios.

Scenario: Get Pet by ID
  Given url 'http://petstore.swagger.io/v2/pet/{petId}'
  And path petId = 1
  When method GET
  Then status 200