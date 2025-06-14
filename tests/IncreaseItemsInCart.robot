*** Settings ***
Documentation     Verify that user can increase the number of items in the Cart
Library           SeleniumLibrary
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/common.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${TESTING_DRINK}    Espresso Macchiato
${TOTAL_PRICE_BEFORE}    '$12.00',
${TOTAL_BUTTON_BEFORE}    'TOTAL: $12.00',
${CART_DATA_BEFORE}    '$12.00 X 1',
${CART_AMOUNT_BEFORE}    'CART (1)',
${TOTAL_PRICE_AFTER}    '$24.00',
${TOTAL_BUTTON_AFTER}    'TOTAL: $24.00',
${CART_DATA_AFTER}    '$12.00 X 2',
${CART_AMOUNT_AFTER}    'CART (2)',

*** Test Cases ***
Increase Items Number In Cart
    [Documentation]    Verify that user can increase the number of items in the Cart
    Go To Menu Page
    Click On Drink Element    ${TESTING_DRINK}
    Go To Cart Page

    ${total_price}=    Get Total Price
    Should Be Equal    ${total_price}    ${TOTAL_PRICE_BEFORE}
    ${total_text}=    Get Total Text
    Should Be Equal    ${total_text}    ${TOTAL_BUTTON_BEFORE}
    Verify Price And Amount    ${CART_DATA_BEFORE}
    Verify Cart Amount    ${CART_AMOUNT_BEFORE}

    Click Plus Button On Cart Page



