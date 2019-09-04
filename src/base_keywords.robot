*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Open Chrome With Media Permission
     [Arguments]  ${go_to_url}
     [Documentation]  This keyword will open the chrome with mic and camera permissions, accepts url which needs to be opened.
     ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
     Call Method  ${options}  add_argument  start-maximized
     Call Method  ${options}  add_argument  --use-fake-ui-for-media-stream
     Call Method  ${options}  add_argument  --use-fake-device-for-media-stream
     ${executor}=  Evaluate  str('${go_to_url}')
     Create Webdriver  Chrome  chrome_options=${options}
     Go To  ${go_to_url}

Search Product And Get Price
    [Documentation]  Need To remove this keyword later on. This is just example as to how we can develop a keyword from tests by parametrizing it
    [Arguments]    ${product}
    Open Browser    http://www.amazon.in    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@value='Go']
    Input Text    //label[@id='nav-search-label']/following-sibling::input    ${product}
    Click Element    //input[@value='Go']
    Capture Page Screenshot
    Wait Until Page Contains Element    //*[text()='${product}']
    Click Element    //*[text()='${product}']
    Capture Page Screenshot
    Select Window    New
    Wait Until Page Contains Element    id=priceblock_ourprice_lbl
    ${price}    Get Text    id=priceblock_ourprice
    Capture Page Screenshot
    Log    ${price}
    Close Window
    Select Window    MAIN
    Capture Page Screenshot
    Close Browser
