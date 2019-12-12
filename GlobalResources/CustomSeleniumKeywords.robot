*** Settings ***
Library  Selenium2Library

*** Keywords ***
Page Should Contain Text
    [Arguments]     ${text}
    Wait Until Keyword Succeeds     1x      1s      Wait Until Page Contains        ${text}

Element Should Contain Text
    [Arguments]     ${element}      ${text}
    Wait Until Keyword Succeeds     3x      10s      Element Should Contain     ${element}      ${text}

Page Should Contain Button
    [Arguments]     ${element}
    Wait Until Keyword Succeeds     3x      10s      Wait Until Page Contains        ${element}

Open Specific Browser
    [Arguments]         ${URL}      ${browser}
    Wait Until Keyword Succeeds     2x      2s      Open Browser        ${URL}      ${browser}

Click on Element
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    2x    2s    Wait Until Page Contains Element    ${element}
    Sleep    0.5s
    Wait Until Keyword Succeeds    1x    1s    Click Element    ${element}

Type Text
    [Arguments]    ${element}    ${valueToType}
    Wait Until Keyword Succeeds    2x    2s    Wait Until Page Contains Element    ${element}
    Wait Until Keyword Succeeds    1x    1s    Input Text    ${element}    ${valueToType}

Select From Dropdown By Label
    [Arguments]    ${element}    ${valueToSelect}
    Wait Until Keyword Succeeds    10x    1s    Wait Until Page Contains Element    ${element}
    Wait Until Keyword Succeeds    10x    1s    Select From List By Label    ${element}    ${valueToSelect}

