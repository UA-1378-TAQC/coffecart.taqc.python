*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/menu_page.robot

*** Variables ***
${POPUP_SELECTOR}    //*[@class='promo']
${POPUP_MESSAGE}     It's your lucky day! Get an extra cup of Mocha for $4.
${POPUP_TIMEOUT}     10s
${ESPRESSO}         Espresso
${ESPRESSO_MACCHIATO}  Espresso Macchiato
${CAPPUCCINO}       Cappuccino

*** Keywords ***
Add Three Items To Trigger Popup
    Click On Drink Element    ${ESPRESSO}
    Click On Drink Element    ${ESPRESSO_MACCHIATO}
    Click On Drink Element    ${CAPPUCCINO}

Verify Popup Appears
    Wait Until Page Contains Element    ${POPUP_SELECTOR}    timeout=${POPUP_TIMEOUT}
    Element Should Contain    ${POPUP_SELECTOR}    ${POPUP_MESSAGE}


Verify Popup Disappears Automatically
    Wait Until Element Is Not Visible    ${POPUP_SELECTOR}    timeout=${POPUP_TIMEOUT}
    Page Should Not Contain Element    ${POPUP_SELECTOR}
