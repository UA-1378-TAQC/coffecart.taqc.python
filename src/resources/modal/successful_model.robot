*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUCCSESS_POPUP}                //*[@id='app']/div[1]
*** Keywords ***
Get Succsessfull Text
    Wait Until Element Is Visible    ${SUCCSESS_POPUP}
    ${text}=    Get Text    ${SUCCSESS_POPUP}
    [Return]    ${text}
