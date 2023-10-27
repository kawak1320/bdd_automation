@labels @acceptance

Feature: Labels

    Scenario:  Verify GET all labels is returning all data correctly
      As a user I want to GET the labels from TODOIST API

    Given I set the base url and headers
    When I call to labels endpoint using "GET" method using the "None" as parameter
    Then I receive a 200 status code in response


  Scenario: Verify POST label endpoint creates a label with the name provided

    Given I set the base url and headers
    When I call to labels endpoint using "POST" method using the "label data" as parameter
    """
    {
      "name": "Label Namex for test"
    }
    """
    Then I receive a 200 status code in response


    @label_id
    Scenario: Verify POST label updates an existent label
      As a user I want to update a label with the label_id provided from TODOIST API

    Given I set the base url and headers
    When I call to labels endpoint using "POST" method using the "update comment" as parameter
    """
    {
      "name": "Label NameX Updated for test"
    }
    """
    Then I receive a 200 status code in response


  @label_id
  Scenario: Verify DELETE label endpoint deletes a label with the name provided

    Given I set the base url and headers
    When I call to labels endpoint using "DELETE" method using the "label_id" as parameter
    Then I receive a 204 status code in response





#  @label_id
#  Scenario:  Verify GET one labels is returning all data correctly
#      As a user I want to GET the labels from TODOIST API
#
#    Given I set the base url and headers
#    When I call to tasks endpoint using "GET" method using the "label_id" as parameter
#    Then I receive a 200 status code in response


