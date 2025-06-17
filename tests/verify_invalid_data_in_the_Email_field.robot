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
    menu_page.Click On Drink Element    Flat White
    menu_page.Go To Cart Page

    Click On Total button On Cart Page

    payment_detail_modal.Enter Name    Viktoriia

    # Invalid email without '@'
    payment_detail_modal.Enter Email   viktoriia11gmail.com
    payment_detail_modal.Click Submit Button
    payment_detail_modal.Verify Payment Modal Is Visible

    # Invalid email without domain
    payment_detail_modal.Enter Email   viktoriia11@
    payment_detail_modal.Click Submit Button
    payment_detail_modal.Verify Payment Modal Is Visible

    # Invalid email with spaces
    payment_detail_modal.Enter Email   viktoriia 11@gmail.com
    payment_detail_modal.Click Submit Button
    payment_detail_modal.Verify Payment Modal Is Visible


