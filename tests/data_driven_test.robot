*** settings ***
Test Template    Data Driven Test Here

*** Keywords ***
Data Driven Test Here
    [Arguments]    ${first_param}    ${last_param}
    ${result}=    Evaluate    ${first_param}+${last_param}
    log to console    ${result}

***Test Cases***
Test1    3    5
Test2    -4    7
Test3    0    2
Test4    -1    -5
Test5    1    10
Test6    2    3