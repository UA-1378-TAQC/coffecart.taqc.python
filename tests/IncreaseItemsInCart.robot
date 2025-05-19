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
    Go To Menu Page
    Click On Drink Element    ${ESPRESSO_MACCHIATO}
    Go To Cart Page

    ${total_price}=    Get Total Price
    Should Be Equal    ${total_price}    $12.00

    ${total_text}=    Get Total Text
    Should Be Equal    ${total_text}    Total: $12.00
    
    Verify Price And Amount    $12.00 x 1
    
    Verify Cart Amount    cart (1)

    Click Plus Button On Cart Page

    ${total_price}=    Get Total Price
    Should Be Equal    ${total_price}    $24.00

    ${total_text}=    Get Total Text
    Should Be Equal    ${total_text}    Total: $24.00
    
    Verify Price And Amount    $12.00 x 2
    
    Verify Cart Amount    cart (2)

