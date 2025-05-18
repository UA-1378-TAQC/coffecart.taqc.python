*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${MENU_PAGE_LINK_XPATH}     //a[@aria-label='Menu page']
${TOTAL_BUTTON_XPATH}       //button[@class='pay']
${PAYMENT_MODAL_XPATH}      //div[@class='modal']

${TOTAL_PRICE_XPATH}          //div[@class='unit-controller']/../following-sibling::*[1]
${PLUS_BUTTON_XPATH}          //*[@id=\"app\"]/div[2]/div/ul/li[2]/div[2]/div/button[1]
${TOTAL_BUTTON_XPATH}         //button[contains(text(), 'Total')]

*** Keywords ***
Click On Total button
    Wait Until Element Is Visible    ${TOTAL_BUTTON_XPATH}
    Click Button    ${TOTAL_BUTTON_XPATH}

Go To Menu Page
    Wait Until Element Is Visible    ${MENU_PAGE_LINK_XPATH}
    Click Link    ${MENU_PAGE_LINK_XPATH}

Verify Payment Modal Appears
    Wait Until Element Is Visible    ${PAYMENT_MODAL_XPATH}

Click Plus Button
    Click Element    xpath=${PLUS_BUTTON_XPATH}

Get Total Price
    ${value}=    Get Text    xpath=${TOTAL_PRICE_XPATH}
    RETURN     ${value}

Get Total Text
    ${value}=    Get Text    xpath=${TOTAL_BUTTON_XPATH}
    RETURN     ${value}
