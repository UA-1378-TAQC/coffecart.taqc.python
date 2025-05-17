*** Settings ***
Documentation     Validate payment form with valid inputs
Library           SeleniumLibrary
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/menu_page.robot
Resource          ../src/resources/modal/payment_detail_modal.robot
Resource          ../src/resources/modal/successful_model.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${VALID_NAME}       Andrii
${VALID_EMAIL}      andrii11@gmail.com

*** Test Cases ***
Verify Payment Form Accepts Valid Inputs
    menu_page.Click On Drink Element     Flat White
    menu_page.Click On Total button
    menu_page.Verify Payment Modal Appears
    payment_detail_modal.Enter Name    ${VALID_NAME}
    payment_detail_modal.Enter Email   ${VALID_EMAIL}
    payment_detail_modal.Click Submit Button
    ${message}=  successful_model.Get Successful Text
    Should Be Equal As Strings    ${message}    Thanks for your purchase. Please check your email for payment.
    menu_page.Verify Total Button Text    Total: $0.00
