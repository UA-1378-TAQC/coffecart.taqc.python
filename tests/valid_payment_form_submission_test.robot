*** Settings ***
Documentation     Validate payment form with valid inputs
Library           SeleniumLibrary
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/menu_page.robot
Resource          ../src/resources/modal/payment_detail_modal.robot
Resource          ../src/resources/modal/successful_modal.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${VALID_NAME}       Andrii
${VALID_EMAIL}      andrii11@gmail.com
${TESTING_DRINK_NAME}    Flat White
${SUCCESSFULL_POPUP_TEXT}    Thanks for your purchase. Please check your email for payment.
${EMPTY_CART_VALES}    Total: $0.00

*** Test Cases ***
Verify Payment Form Accepts Valid Inputs
    Click On Drink Element     ${TESTING_DRINK_NAME}
    Click On Total button On Menu Page
    Verify Payment Modal Appears On Menu Page
    Enter Name    ${VALID_NAME}
    Enter Email   ${VALID_EMAIL}
    Click Submit Button
    ${message}=  Get Successful Text
    Should Be Equal As Strings    ${message}    ${SUCCESSFULL_POPUP_TEXT}
    Verify Total Button Text    ${EMPTY_CART_VALES}
