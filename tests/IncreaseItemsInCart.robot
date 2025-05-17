*** Settings ***
Documentation     Verify that user can increase the number of items in the Cart
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/
${ESPRESSO_MACCHIATO}    Espresso Macchiato
   

*** Test Cases ***
Increase Items Number In Cart
    Open Browser         ${URL}             ${BROWSER}
    Click On Cup
    Go To Cart Page
    ${item_name}=    Get Item Name
    Should Be Equal    ${item_name}    ${ESPRESSO_MACCHIATO}
    ${item_count}=    Get Item Count
    Should Be Equal    ${item_count}    \1
    Click On Add Button
    ${item_count}=    Get Item Count
    Should Be Equal    ${item_count}    \2
    ${unit_desc}=    Get Unit Desc
    Should Be Equal    ${unit_desc}    \$12.00 x 2
    ${total_price}=    Get Total Price
    Should Be Equal    ${total_price}    \24.00
    ${header_count}=    Get Header Count
    Should Be Equal    ${header_count}    \2
    Close Browser