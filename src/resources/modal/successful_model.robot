*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUCCSESS_POPUP}                //*[@id='app']/div[1]
*** Keywords ***
Get Successful Text
    Wait Until Element Is Visible    ${SUCCSESS_POPUP}
    ${text}=    Get Text    ${SUCCSESS_POPUP}
    RETURN    ${text}
