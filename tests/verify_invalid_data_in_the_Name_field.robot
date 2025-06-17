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
    Click On Drink Element    Flat White
    Click On Total Button On Menu Page
    
    #Leave 'Name' input field empty
    Click Submit Button
    Verify Payment Modal Appears On Menu Page

    Verify Name Validation Message    Заповніть це поле.

Verify Error Handling while 'Name' input contains numbers
    menu_page.Click On Drink Element    Flat White
    Click On Total Button On Menu Page

    Enter Name    123Viktoriia
    Enter Email    viktoriia11@gmail.com
    Click Submit Button
    Verify Payment Modal Appears On Menu Page
    Verify Name Validation Message    Поле "Ім'я" не може містити цифри.

Verify Error Handling while 'Name' input contains special symbols
    menu_page.Click On Drink Element    Flat White
    Click On Total Button On Menu Page

    Enter Name    @#viktoriia!
    Enter Email    viktoriia11@gmail.com
    Click Submit Button
    Verify Payment Modal Appears On Menu Page
    Verify Name Validation Message    Поле "Ім'я" не може містити спеціальні символи.


