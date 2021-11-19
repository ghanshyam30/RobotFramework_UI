*** Settings ***
Library    SeleniumLibrary
Resource    ../src/base_keywords.robot
Test Setup    Start Browser And Open Test URL    https://www.amazon.in
Test Teardown    Close Browser Test
*** Keywords ***
Start Browser And Open Test URL
    [Documentation]    'This is setup keyword'
    [Arguments]    ${BASE_URL}='http://www.google.com'
    Open Browser    ${BASE_URL}    firefox    executable_path=/home/thebadcoder/TestWorkspace/RobotFramework_UI/drivers/geckodriver
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@value='Go']

Close Browser Test
    [Documentation]    'This is teardown keyword'
    Close Browser

*** Test Cases ***
Search Bluetooth Headphones
    Input Text    //input[@id='twotabsearchtextbox']    Oneplus bluetooth
    Click Element    //input[@value='Go']
    Capture Page Screenshot
    Wait Until Page Contains Element    //*[text()='OnePlus Bullets Wireless Z Bass Edition (Reverb Red)']
    Click Element    //*[text()='OnePlus Bullets Wireless Z Bass Edition (Reverb Red)']
    Capture Page Screenshot
    Switch Window    New
    Reload Page
    Wait Until Page Contains Element    id=priceblock_ourprice    timeout=15
    ${price}    Get Text    id=priceblock_ourprice 
    Capture Page Screenshot
    Log    ${price}
    Close Window
    Switch Window    MAIN
    Capture Page Screenshot
    # [Teardown]

Search Mobile Phone
    Input Text    //input[@id='twotabsearchtextbox']    OnePlus Nord 2
    Click Element    //input[@value='Go']
    Capture Page Screenshot
    Wait Until Page Contains Element    //*[text()='OnePlus Nord 2 5G (Blue Haze, 8GB RAM, 128GB Storage)']
    Click Element    //*[text()='OnePlus Nord 2 5G (Blue Haze, 8GB RAM, 128GB Storage)']
    Reload Page
    Switch Window    New
    Wait Until Page Contains Element    id=priceblock_dealprice    timeout=15
    ${price}    Get Text    id=priceblock_dealprice
    Capture Page Screenshot
    Log    ${price}
    Close Window
    Switch Window    MAIN
    # [Teardown]

# Purchase product
#     Search Product And Get Price    Mi Band 3 (Black)