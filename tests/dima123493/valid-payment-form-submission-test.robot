*** Settings ***
Documentation     Validate payment form with valid inputs
Resource          ../src/resources/common.robot
Library           SeleniumLibrary
Library           ../src/dima123493/PaymentFormSubmission.py
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/
${VALID_NAME}       Andrii
${VALID_EMAIL}      andrii11@gmail.com
${message}
${cart_value}

*** Test Cases ***
Verify Payment Form Accepts Valid Inputs
    Payment Form Submission.Click on coffee cup    1
    Payment Form Submission.Click on total modal
    Payment Form Submission.Confirm Payment Form Is Visible
    Payment Form Submission.Enter Name    ${VALID_NAME}
    Payment Form Submission.Enter Email    ${VALID_EMAIL}
    Payment Form Submission.Click Submit Button
    ${message}=    Payment Form Submission.Verify Confirmation Message Appears
    Should Be Equal As Strings    ${message}    Thanks for your purchase. Please check your email for payment.
    ${cart_value}=    Payment Form Submission.Verify Cart Is Empty Or Total Resets
    Should Be Equal As Strings    ${cart_value}    Total: $0.00
    Close Browser
