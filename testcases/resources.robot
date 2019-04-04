*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Variables    ./locators.yaml   
 

*** Keywords ***
Open Calculator
    [Arguments]    ${url}=https://www.baidu.com
    # Open Browser    ${url}    chrome
    Create Webdriver    Chrome    executable_path=/usr/local/bin/chromedriver    
    Maximize Browser Window
    Go To    ${url}
    Input Text    ${search_text_locator}    计算器
    Click Button    ${search_button_locator}
    Wait Until Page Contains Element    ${calc_locator} 
    Set Selenium Speed    0.5
    
Calculator has been cleared
    Push Button C
    
Close Calculator
    Close Browser
    
User Type "${expression}"
    @{char}    Split String    ${expression}    ${SPACE}
    :FOR    ${i}    IN    @{char}
    \    Push Button ${i}
    Push Button =
    
Add ${number1} and ${number2}
    # Log Many    ${number1}    ${number2}
    Push Button ${number1}
    Push Button +
    Push Button ${number2}
    Push Button =
    
Push Button ${button}
    # Log    ${button}    
    Run keyword IF    '${button}'=='1'    Click Element    ${button_1_locator}    
    ...    ELSE IF    '${button}'=='2'    Click Element    ${button_2_locator}  
    ...    ELSE IF    '${button}'=='3'    Click Element    ${button_3_locator}
    ...    ELSE IF    '${button}'=='6'    Click Element    ${button_6_locator}  
    ...    ELSE IF    '${button}'=='+'    Click Element    ${button_add_locator}
    ...    ELSE IF    '${button}'=='='    Click Element    ${button_equal_locator} 
    ...    ELSE IF    '${button}'=='-'    Click Element    ${button_sub_locator}
    ...    ELSE IF    '${button}'=='/'    Click Element    ${button_div_locator}
    ...    ELSE IF    '${button}'=='*'    Click Element    ${button_multi_locator}
    ...    ELSE    Log    none
    
Result should be ${expected}
    # ${result} =    Get Result
    ${result} =    Get Text    ${text_screen_result}
    # Capture Element Screenshot    ${text_screen_result}    
    Should Be Equal    ${result}    ${expected}
    