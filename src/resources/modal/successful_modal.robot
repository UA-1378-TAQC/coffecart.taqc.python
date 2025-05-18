*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUCCSESS_POPUP}                //*[@class='snackbar success']

*** Keywords ***
Get Successful Text
    Wait Until Element Is Visible    ${SUCCSESS_POPUP}
    ${text}=    Get Text    ${SUCCSESS_POPUP}
    RETURN    ${text}
