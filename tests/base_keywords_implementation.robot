*** Settings ***
Library         SeleniumLibrary
Resource        ..\\src\\base_keywords.robot

*** Variables ***
${base_url}         http://google.com

*** Test Cases ***
Test 001 Open New Browser Window And Close Previous
    [Documentation]         Implementation of the keyword "Open New Browser Tab And Close Previous"
    ${url_for_new_tab}      Set Variable            https://google.com              # Just in case the new url needs to be opened
    Open Browser            ${base_url}             Chrome                          # Simulating the scenario where we have browser open and then move on to add tab in next step
    Open New Browser Tab And Close Previous         ${url_for_new_tab}

