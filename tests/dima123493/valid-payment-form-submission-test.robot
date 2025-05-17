*** Settings ***
Documentation     Validate payment form with valid inputs
Resource          ../src/resources/common.robot
Library           SeleniumLibrary
Library           ../src/dima123493/PaymentForm.py
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/
${VALID_NAME}       Andrii
${VALID_EMAIL}      andrii11@gmail.com

*** Test Cases ***
Verify Payment Form Accepts Valid Inputs
    Payment Form.Click on coffee cup    1
    Payment Form.Click on total modal
    Payment Form.Confirm Payment Form Is Visible
    Payment Form.Enter Name    ${VALID_NAME}
    Payment Form.Enter Email    ${VALID_EMAIL}
    Payment Form.Click Submit Button
    ${message}=    Payment Form.Verify Confirmation Message Appears
    Should Be Equal As Strings    ${message}    Thanks for your purchase. Please check your email for payment.
    ${cart_value}=    Payment Form.Verify Cart Is Empty Or Total Resets
    Should Be Equal As Strings    ${cart_value}    Total: $0.00
