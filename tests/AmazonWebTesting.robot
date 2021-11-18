*** Settings ***
Library    SeleniumLibrary
Resource    ../src/base_keywords.robot
*** Test Cases ***
Search for the mi band 3 and get its price
    Open Browser    http://www.amazon.in    firefox    executable_path=/home/thebadcoder/TestWorkspace/RobotFramework_UI/drivers/geckodriver
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@value='Go']
    Input Text    //input[@id='twotabsearchtextbox']    Mi band 3
    Click Element    //input[@value='Go']
    Capture Page Screenshot
    Wait Until Page Contains Element    //*[text()='Mi Band 3 (Black)']
    Click Element    //*[text()='Mi Band 3 (Black)']
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

Purchase product
    Search Product And Get Price    Mi Band 3 (Black)