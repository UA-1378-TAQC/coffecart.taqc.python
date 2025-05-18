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
    menu_page.Click On Drink Element     ${TESTING_DRINK_NAME}
    menu_page.Click On Total button
    menu_page.Verify Payment Modal Appears
    payment_detail_modal.Enter Name    ${VALID_NAME}
    payment_detail_modal.Enter Email   ${VALID_EMAIL}
    payment_detail_modal.Click Submit Button
    ${message}=  successful_modal.Get Successful Text
    Should Be Equal As Strings    ${message}    ${SUCCESSFULL_POPUP_TEXT}
    menu_page.Verify Total Button Text    ${EMPTY_CART_VALES}
