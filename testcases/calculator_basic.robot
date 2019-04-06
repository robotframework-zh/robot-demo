*** Settings ***
Resource     resources.robot
Suite Setup    Open Calculator
Suite Teardown    Close Calculator

*** Variables ***

*** Test Cases ***
Test Additions
    Given Calculator has been cleared
    When User Type "1 + 2"
    Then Result Should Be 3
    
Test Substractions
    Given Calculator has been cleared
    When User Type "1 - 2"
    Then Result Should Be -1
    
Test Multiplication
    Given Calculator has been cleared
    When User Type "6 * 2"
    Then Result Should Be 12
    
Test Division
    Given Calculator has been cleared
    When User Type "6 / 2"
    Then Result Should Be 3
    
    