*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${DRINK_XPATH}                      //*[@id='app']/div[2]/ul/li/h4[normalize-space(text())='{}']/following-sibling::*
${CART_PAGE_LINK_XPATH}             //a[@aria-label='Cart page']
${TOTAL_BUTTON_XPATH}               //button[@class='pay']
${PLUS_BUTTON_XPATH_CART_MODAL}     //*[@id="app"]/div[2]/div[1]/ul/li/div[2]/button[1]
${MINUS_BUTTON_XPATH_CART_MODAL}    //*[@id="app"]/div[2]/div[1]/ul/li/div[2]/button[2]
${PAYMENT_MODAL_XPATH}              //div[@class='modal']
${SUCCESSFUL_POPUP_XPATH}           //div[contains(@class,'snackbar success')]
${CART_COMPONENT_ROOT_XPATH}        //ul[@class='cart-preview show']
${MODAL_CLOSE_BUTTON_XPATH}         //div[@class='modal']//section/button

*** Keywords ***
Click On Drink Element
    [Arguments]     ${drink_name}
    ${locator}=     Evaluate    "${DRINK_XPATH}".replace("{}", "${drink_name}")
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Go To Cart Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}
    Click Link    ${CART_PAGE_LINK_XPATH}

Click On Total Button
    Wait Until Element Is Enabled    ${TOTAL_BUTTON_XPATH}
    Click Button    ${TOTAL_BUTTON_XPATH}

Click Plus Button
    Click Element    xpath=${PLUS_BUTTON_XPATH_CART_MODAL}

Click Minus Button
    Click Element    xpath=${MINUS_BUTTON_XPATH_CART_MODAL}

Verify Payment Modal Appears
    Wait Until Element Is Visible    ${PAYMENT_MODAL_XPATH}
    Element Should Be Visible    ${PAYMENT_MODAL_XPATH}
    ...    msg=Payment modal should appear on click

Verify Payment Modal Disappears
    Wait Until Element Is Not Visible    ${PAYMENT_MODAL_XPATH}

Verify Total Button Text
    [Arguments]     ${value}
    Element Text Should Be    ${TOTAL_BUTTON_XPATH}    ${value}

Verify Successful Popup Appears
    Wait Until Element Is Visible    ${SUCCESSFUL_POPUP_XPATH}

Verify Cart Link Equal
    [Arguments]     ${link_text}
    Element Text Should Be    ${CART_PAGE_LINK_XPATH}    ${link_text}

Hover Over Total Button On Menu Page
    Mouse Over    ${TOTAL_BUTTON_XPATH}

Get CSS Property Value
    [Arguments]    ${locator}    ${property}
    ${value}=    Execute JavaScript
    ...    return window.getComputedStyle(document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue).getPropertyValue("${property}");
    RETURN    ${value}

Close Modal Window On Menu Page
    Wait Until Element Is Visible    ${MODAL_CLOSE_BUTTON_XPATH}
    Click Element    ${MODAL_CLOSE_BUTTON_XPATH}
