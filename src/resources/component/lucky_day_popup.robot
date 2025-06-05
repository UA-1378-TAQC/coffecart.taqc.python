*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/menu_page.robot

*** Variables ***
${POPUP_XPATH}    //*[@class='promo']
${POPUP_MESSAGE}     It's your lucky day! Get an extra cup of Mocha for $4.
${POPUP_TIMEOUT}     10s
${ESPRESSO}         Espresso
${ESPRESSO_MACCHIATO}  Espresso Macchiato
${CAPPUCCINO}       Cappuccino
${YES_POPUP_BUTTON}    //div[@class='promo']//button[contains(text(), 'Yes, of course!')]


*** Keywords ***
Add Three Items To Trigger Popup
    Click On Drink Element    ${ESPRESSO}
    Click On Drink Element    ${ESPRESSO_MACCHIATO}
    Click On Drink Element    ${CAPPUCCINO}

Verify Popup Appears
    Wait Until Page Contains Element    ${POPUP_XPATH}    timeout=${POPUP_TIMEOUT}
    Element Should Contain    ${POPUP_XPATH}    ${POPUP_MESSAGE}


Verify Popup Disappears Automatically
    Wait Until Element Is Not Visible    ${POPUP_XPATH}    timeout=${POPUP_TIMEOUT}
    Page Should Not Contain Element    ${POPUP_XPATH}

Click Yes On Successful Popup
    Wait Until Element Is Visible    ${YES_POPUP_BUTTON}
    Click Button    ${YES_POPUP_BUTTON}
