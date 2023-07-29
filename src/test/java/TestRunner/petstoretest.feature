Feature: Test de lAPI Petstore Swagger

Background:
  * url 'https://petstore3.swagger.io/api/v3'
  
Scenario: Ajouter un nouvel animal
  Given path '/pet'
  And request { id: 100, name: 'monAnimal', status: 'available' }
  When method post
  Then status 200
  
Scenario: Récupérer les informations dun animal par ID
  Given path '/pet/{petId}'
  And path petId = 100
  When method get
  Then status 200
  And match response == { id: 100, name: 'monAnimal' }

Scenario: Rechercher des animaux par statut
  Given path '/pet/findByStatus'
  And params { status: 'available' }
  When method get
  Then status 200
  And match response contains { name: 'monAnimal', status: 'available' }

Scenario: Supprimer un animal par ID
  Given path '/pet/{petId}'
  And path petId = 100
  When method delete
  Then status 200
