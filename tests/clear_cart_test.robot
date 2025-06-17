*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/modal/payment_detail_modal.robot
Library      SeleniumLibrary

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***  
Clear A Cart With One Product
    Click On Drink Element     Flat White
    Go To Cart Page
    
    Click On Total button On Cart Page
    Verify Payment Modal Appears On Cart Page
    Enter Name    mariia
    Enter Email   kk@jjj.kkk
    Click Submit Button

    Verify Payment Modal Disappears
    Verify Cart Link Equal    cart (0)
    Verify Total Button Text    Total: $0.00
    Verify Successful Popup Appears


Clear A Cart With Tree Products
    Click On Drink Element    Americano
    Click On Drink Element    Espresso Macchiato
    Click On Drink Element    Espresso
    Go To Cart Page
    
    Click On Total button On Cart Page
    Enter Name    mariia
    Enter Email   kk@jjj.kkk
    Click Submit Button

    Verify Payment Modal Disappears
    Verify Cart Link Equal    cart (0)
    Verify Total Button Text    Total: $0.00
    Verify Successful Popup Appears
