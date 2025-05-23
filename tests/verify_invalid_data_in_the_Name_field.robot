*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/modal/payment_detail_modal.robot
Library     SeleniumLibrary

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***
Verify appropriate actions while empty 'Name' field
    menu_page.Click On Drink Element    Flat White
    menu_page.Click On Total Button
    
    #Leave 'Name' input field empty
    payment_detail_modal.Click Submit Button
    menu_page.Verify Payment Modal Appears

    payment_detail_modal.Verify Name Validation Message    Заповніть це поле.

Verify Error Handling while 'Name' input contains numbers
    menu_page.Click On Drink Element    Flat White
    menu_page.Click On Total Button

    payment_detail_modal.Enter Name    123Viktoriia    
    payment_detail_modal.Enter Email    viktoriia11@gmail.com
    payment_detail_modal.Click Submit Button
    menu_page.Verify Payment Modal Appears
    payment_detail_modal.Verify Name Validation Message    Поле "Ім'я" не може містити цифри.

Verify Error Handling while 'Name' input contains special symbols
    menu_page.Click On Drink Element    Flat White
    menu_page.Click On Total Button

    payment_detail_modal.Enter Name    @#viktoriia!
    payment_detail_modal.Enter Email    viktoriia11@gmail.com
    payment_detail_modal.Click Submit Button
    menu_page.Verify Payment Modal Appears
    payment_detail_modal.Verify Name Validation Message    Поле "Ім'я" не може містити спеціальні символи.


    