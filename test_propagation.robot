*** Settings ***
Library     SeleniumLibrary
Library     EyesLibrary       runner=web_ufg    config=applitools.yaml

Test Setup        Setup
Test Teardown     Teardown


*** Keywords ***
Setup
    Open Browser    https://demo.applitools.com/index_v2.html    headlesschrome
    Eyes Open


Teardown
    Eyes Close Async
    Close All Browsers


Process
    [Arguments]    ${test_name}
    Eyes Check Window    ${test_name}    Fully


*** Test Cases ***
Example test
    Process    Test1
    Input Text        id:username    user
    Input Text        id:password    pwd
    Click Element     id:log-in
    Process    Test2
