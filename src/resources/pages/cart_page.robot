*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${MENU_PAGE_LINK_XPATH}     //a[@aria-label='Menu page']
${TOTAL_BUTTON_XPATH}       //button[@class='pay']
${PAYMENT_MODAL_XPATH}      //div[@class='modal']


*** Keywords ***
Click On Total button
    Wait Until Element Is Visible    ${TOTAL_BUTTON_XPATH}
    Click Button    ${TOTAL_BUTTON_XPATH}

Go To Menu Page
    Wait Until Element Is Visible    ${MENU_PAGE_LINK_XPATH}
    Click Link    ${MENU_PAGE_LINK_XPATH}

Verify Payment Modal Appears
    Wait Until Element Is Visible    ${PAYMENT_MODAL_XPATH}

