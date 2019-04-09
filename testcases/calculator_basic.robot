*** Settings ***
Resource    resources.robot
Suite Setup    Open Calculator    
Suite Teardown    Close Calculator

*** Variables ***

*** Test Cases ***
Test Additations
    Given Calculator has been cleared
    When User Type "11 + 2"
    Then Result should be 13