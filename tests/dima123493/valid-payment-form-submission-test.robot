*** Settings ***
Documentation     Validate payment form with valid inputs
Library           SeleniumLibrary
Library           ../src/dima123493/PaymentFormSubmission.py

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/
${VALID_NAME}       Andrii
${VALID_EMAIL}      andrii11@gmail.com
${message}
${number}

*** Test Cases ***
Verify Payment Form Accepts Valid Inputs
    Open Browser         ${URL}             ${BROWSER}
    Payment Form Submission.click on coffee cup    1
    Payment Form Submission.click_on_total_modal
    Payment Form Submission.Confirm Payment Form Is Visible
    Payment Form Submission.Enter Name    ${VALID_NAME}
    Payment Form Submission.Enter Email    ${VALID_EMAIL}
    Payment Form Submission.Click Submit Button
    ${message}= Payment Form Submission.Verify Confirmation Message Appears
    Should Be Equal As Strings    ${message}    No coffee, go add some.
    ${number}= Payment Form Submission.Verify Cart Is Empty Or Total Resets
    Should Be Equal As Integers    ${number}    0
    Close Browser
    
