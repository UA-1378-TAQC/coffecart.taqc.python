*** Settings ***
Documentation     Verify that user can increase the number of items in the Cart
Library           SeleniumLibrary
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/common.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/
${ESPRESSO_MACCHIATO}    Espresso Macchiato

*** Test Cases ***
Increase Items Number In Cart
    [Documentation]    Verify that user can increase the number of items in the Cart
    Maximize Browser Window
       Go To Menu Page
    Sleep    1s
    Click On Drink Element    ${ESPRESSO_MACCHIATO}
    Sleep    1s
    Go To Cart Page
    Sleep    1s
    ${total_price}=    Get Total Price
    Should Be Equal    ${total_price}    $12.00

    ${total_text}=    Get Total Text
    Should Be Equal    ${total_text}    Total: $12.00

    Click Plus Button
    Sleep    1s

    ${total_price}=    Get Total Price
    Log    Total Price: ${total_price}
    Should Be Equal    ${total_price}    $24.00

    ${total_text}=    Get Total Text
    Log    Total Text: ${total_text}
    Should Be Equal    ${total_text}    Total: $24.00

