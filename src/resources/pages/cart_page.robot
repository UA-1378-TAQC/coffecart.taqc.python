*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${MENU_PAGE_LINK_XPATH}         //a[@aria-label='Menu page']
${TOTAL_BUTTON_XPATH}           //button[@class='pay']
${PAYMENT_MODAL_XPATH}          //div[@class='modal']
${TOTAL_PRICE_XPATH}            //div[@class='unit-controller']/../following-sibling::*[1]
${PLUS_BUTTON_XPATH}            //*[@id="app"]/div[2]/div/ul/li[2]/div[2]/div/button[1]
${MINUS_BUTTON_XPATH}           //*[@id="app"]/div[2]/div/ul/li[2]/div[2]/div/button[2]
${EMPTY_TEXT_XPATH}             //*[contains(text(),"No coffee, go add some.")]
${DATA_IN_CART_XPATH}           //*[@id="app"]/div[2]/div/ul/li[2]/div[2]/span
${DATA_IN_CART_TOTAL_PRICE_XPATH}    //*[@id="app"]/div[2]/div/ul/li[2]/div[3]
${CART_AMOUNT_XPATH}            //*[@id="app"]/ul/li[2]/a
${MODAL_CLOSE_BUTTON_XPATH}     //div[@class='modal']//section/button

*** Keywords ***
Click On Total Button On Cart Page
    Wait Until Element Is Visible    ${TOTAL_BUTTON_XPATH}
    Click Button    ${TOTAL_BUTTON_XPATH}

Go To Menu Page
    Wait Until Element Is Visible    ${MENU_PAGE_LINK_XPATH}
    Click Link    ${MENU_PAGE_LINK_XPATH}

Verify Payment Modal Appears On Cart Page
    Wait Until Element Is Visible    ${PAYMENT_MODAL_XPATH}
    Element Should Be Visible    ${PAYMENT_MODAL_XPATH}
    ...    msg=Payment modal should appear on click in cart page

Click Plus Button On Cart Page
    Click Element    xpath=${PLUS_BUTTON_XPATH}

Click Minus Button On Cart Page
    Click Element    xpath=${MINUS_BUTTON_XPATH}

Get Total Price
    ${value}=    Get Text    xpath=${TOTAL_PRICE_XPATH}
    RETURN     ${value}

Get Total Text
    ${value}=    Get Text    xpath=${TOTAL_BUTTON_XPATH}
    RETURN     ${value}

Get Cart Data
    ${value}=    Get Text    xpath=${DATA_IN_CART_XPATH}
    RETURN    ${value}

Get Cart Price
    ${value}=     Get Text    xpath=${DATA_IN_CART_TOTAL_PRICE_XPATH}
    RETURN    ${value}

Get Cart Amount
    ${value}=    Get Text    xpath=${CART_AMOUNT_XPATH}
    RETURN    ${value}

Total Button Should Be Visible
    Wait Until Element Is Visible    ${TOTAL_BUTTON_XPATH}
    Element Should Be Visible    ${TOTAL_BUTTON_XPATH}

Total Button Should Not Be Visible
    Wait Until Element Is Not Visible    ${TOTAL_BUTTON_XPATH}
    Element Should Not Be Visible    ${TOTAL_BUTTON_XPATH}

Cart Page Should Contain Empty Text Element
    Wait Until Element Is Visible    ${EMPTY_TEXT_XPATH}
    Element Should Be Visible    ${EMPTY_TEXT_XPATH}

Verify Price And Amount
    [Arguments]     ${expected_data}
    ${actual_data}=    Get Cart Data
    Should Be Equal    ${actual_data}    ${expected_data}

Verify Price
    [Arguments]    ${expected_data}
    ${actual_data}=     Get Cart Price
    Should Be Equal    ${actual_data}    ${expected_data}

Verify Total Price
    [Arguments]    ${expected_data}
    ${actual_data}=    Get Total Text
    Should Be Equal    ${actual_data}    ${expected_data}

Verify Cart Amount
    [Arguments]    ${expected_data}
    ${actual_data}=    Get Cart Amount
    Should Be Equal    ${actual_data}    ${expected_data}

Verify Drink Is In Cart
    [Arguments]    ${drink_name}
    ${item_xpath}=    Set Variable    //li[contains(text(), '${drink_name}')]
    Wait Until Element Is Visible    ${item_xpath}    timeout=5s

Hover Over Total Button On Cart Page
    Mouse Over    ${TOTAL_BUTTON_XPATH}

Get CSS Property Value
    [Arguments]    ${locator}    ${property}
    ${value}=    Execute JavaScript
    ...    return window.getComputedStyle(document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue).getPropertyValue("${property}");
    RETURN    ${value}

Close Modal Window On Cart Page
    Wait Until Element Is Visible    ${MODAL_CLOSE_BUTTON_XPATH}
    Click Element    ${MODAL_CLOSE_BUTTON_XPATH}
