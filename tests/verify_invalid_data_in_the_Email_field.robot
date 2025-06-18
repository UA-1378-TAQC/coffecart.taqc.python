*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/modal/payment_detail_modal.robot
Library     SeleniumLibrary

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***
Verify Invalid Email Formats In Payment Form
    Click On Drink Element    Flat White
    Go To Cart Page

    Click On Total button On Cart Page

    Enter Name    Viktoriia

    Enter Email   viktoriia11gmail.com
    Click Submit Button
    Verify Payment Modal Is Visible

    Enter Email   viktoriia11@
    Click Submit Button
    Verify Payment Modal Is Visible

    Enter Email   viktoriia 11@gmail.com
    Click Submit Button
    Verify Payment Modal Is Visible
    