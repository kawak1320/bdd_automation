@tasks @acceptance

Feature: Tasks

  Scenario:  Verify GET all tasks is returning all data correctly
      As a user I want to GET the tasks from TODOIST API

    Given I set the base url and headers
    When I call to tasks endpoint using "GET" method using the "None" as parameter
    Then I receive a 200 status code in response


  Scenario:  Verify POST section creates the task correctly
      As a user I want to create a task from TODOIST API

    Given I set the base url and headers
    When I call to tasks endpoint using "POST" method using the "task data" as parameter
    """
    {
      "content": "Task created from feature",
      "due_string": "tomorrow at 11:00",
      "due_lang": "es",
      "priority": 3
    }
    """
    Then I receive a 200 status code in response

  @project_id
  Scenario:  Verify POST section creates the task using a project provided correctly
      As a user I want to create a task with project id provided from TODOIST API

    Given I set the base url and headers
    When I call to tasks endpoint using "POST" method using the "task data" as parameter
    """
    {
      "content": "Task created from feature",
      "project_id": "project_id",
      "due_string": "tomorrow at 11:00",
      "due_lang": "es",
      "priority": 3
    }
    """
    Then I receive a 200 status code in response


  @task_id
  Scenario:  Verify DELETE task delete the section correctly
      As a user I want to delete a task from TODOIST API

    Given I set the base url and headers
    When I call to tasks endpoint using "DELETE" method using the "task_id" as parameter
    Then I receive a 204 status code in response
    And I validate the response data from file using ""

  @task_id
  Scenario:  Verify that a task can be reopened
      As a user I want to reopen a task from TODOIST API
    Given I set the base url and headers
    When I want close the task
    Then I want to reopen the task
    And I receive a 204 status code in response


  @project_id
  Scenario Outline:  Verify POST task creates multiple tasks using a project provided correctly
      As a user I want to create multiple tasks with project id provided from TODOIST API

    Given I set the base url and headers
    When I call to tasks endpoint using "POST" method using the "task data" as parameter
    """
    {
      "content": "<content>",
      "project_id": "project_id",
      "due_string": "<due_string>",
      "due_lang": "es",
      "priority": <priority>
    }
    """
    Examples:
    |  content      |  due_string          |   priority   |
    |  First task   |  tomorrow at 11:00   |      4       |
    |  Second task  |  tomorrow at 12:00   |      2       |
    |  Third task   |  tomorrow at 10:00   |      3       |
