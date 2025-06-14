*** Settings ***
Library     SeleniumLibrary
Library     String
*** Variables ***
${CART_TEXT_XPATH}    //a[@aria-label="Cart page"]

*** Keywords ***
Get Cart Counter Value
    ${text}=    Get Text    ${CART_TEXT_XPATH}
    ${number}=  Replace String    ${text}    cart (    ${EMPTY}
    ${number}=  Replace String    ${number}    )    ${EMPTY}
    ${value}=   Convert To Integer    ${number}
    RETURN      ${value}
