*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/modal/payment_detail_modal.robot
Library      SeleniumLibrary
Library    ../src/CartPage.py
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***  
Clear A Cart With One Product
    Click On Drink Element     Flat White
    menu_page.Go To Cart Page
    
    cart_page.Click On Total button
    cart_page.Verify Payment Modal Appears
    payment_detail_modal.Enter Name    mariia
    payment_detail_modal.Enter Email   kk@jjj.kkk
    payment_detail_modal.Click Submit Button

    menu_page.Verify Payment Modal Disappears
    menu_page.Verify Cart Link Equal    cart (0)
    menu_page.Verify Total Button Text    Total: $0.00
    menu_page.Verify Successful Popup Appears


Clear A Cart With Tree Products
    menu_page.Click On Drink Element    Americano
    menu_page.Click On Drink Element    Espresso Macchiato
    menu_page.Click On Drink Element    Espresso
    menu_page.Go To Cart Page
    
    cart_page.Click On Total button
    payment_detail_modal.Enter Name    mariia
    payment_detail_modal.Enter Email   kk@jjj.kkk
    payment_detail_modal.Click Submit Button

    menu_page.Verify Payment Modal Disappears
    menu_page.Verify Cart Link Equal    cart (0)
    menu_page.Verify Total Button Text    Total: $0.00
    menu_page.Verify Successful Popup Appears





