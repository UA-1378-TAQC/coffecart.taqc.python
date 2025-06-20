*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUCCESS_POPUP}                //*[@class='snackbar success']

*** Keywords ***
Get Successful Text
    Wait Until Element Is Visible    ${SUCCESS_POPUP}
    ${text}=    Get Text    ${SUCCESS_POPUP}
    RETURN    ${text}
