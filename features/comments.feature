@comments @acceptance

Feature: Comments

  @task_id @comment_id
  Scenario:  Verify GET all comment is returning all data correctly
      As a user I want to GET the comment from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "GET" method using the "comment_id" as parameter
    Then I receive a 200 status code in response


  @task_id
  Scenario: Verify POST comment creates a comment in the task provided
      As a user I want to create a comment with the task id provided from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "POST" method using the "comment data" as parameter
    """
    {
      "task_id": "task_id",
      "content": "Comment creates - needs one bottle of milk"
    }
    """
    Then I receive a 200 status code in response


    @task_id @comment_id
    Scenario: Verify POST comment updates a comment
      As a user I want to update a comment with the comment_id provided from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "POST" method using the "update comment" as parameter
    """
    {
      "content": "Comment updated for need one bottle of milk"
    }
    """
    Then I receive a 200 status code in response


  @task_id @comment_id
  Scenario:  Verify DELETE comment delete the task comment correctly
      As a user I want to delete a task from TODOIST API

    Given I set the base url and headers
    When I call to comments endpoint using "DELETE" method using the "comment_id" as parameter
    Then I receive a 204 status code in response
