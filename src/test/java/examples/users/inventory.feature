Feature: Test the inventory API

  Background:
    * url 'http://localhost:3100/api'
    * header Accept = 'application/json'

# 1. Get all menu items
  Scenario: Get all menu items and validate their structure
    Given path '/inventory'
    When method GET
    Then status 200
    And assert response.data.length >= 9
    And match each response.data[*].id != null
    And match each response.data[*].name != null
    And match each response.data[*].price != null
    And match each response.data[*].image != null


# 2. Filter items by ID
  Scenario: Filter by a specific ID
    Given path '/inventory/filter'
    And param id = 3
    When method GET
    Then status 200
    And match response == { "id": "3", "name": "Baked Rolls x 8", "price": "$10", "image": "roll.png" }


#3. Add new item and #6. validate item was added
Scenario: Add a new item and then validate its presence in the inventory
    * def uniqueId = java.util.UUID.randomUUID().toString()
    * def randomName = 'Item-' + Math.floor(Math.random() * 1000)
    * def randomPrice = '$' + Math.floor(Math.random() * 100)
    * def newItem = { "id": "#(uniqueId)", "name": '#(randomName)', "image": 'newItem.png', "price": '#(randomPrice)' }

    # Add item with a unique ID
    Given path '/inventory/add'
    And request newItem
    When method POST
    Then status 200
    
    # Validate that the newly added item is present
    Given path '/inventory'
    When method GET
    Then status 200
    And match response.data[*] contains newItem

# 4. Add item for existent id
  Scenario: Attempt to add an item that already exists
    * def existingItem = { "id": "3", "name": "Baked Rolls x 8", "image": "roll.png", "price": "$10" }
    
    Given path '/inventory/add'
    And request existingItem
    When method POST
    Then status 400


  # 5. Add item with missing information
  Scenario: Attempt to add an item with missing information
    Given path '/inventory/add'
    And request { "name": "Baked Rolls x 8", "image": "roll.png", "price": "$10" }
    When method POST
    Then status 400
    And match response contains "Not all requirements are met"