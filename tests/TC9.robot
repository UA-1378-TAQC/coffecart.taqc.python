*** Settings ***
Documentation     Verify the correctness of decreasing the number of items on the "Cart" page
Library    SeleniumLibrary
Library    ../src/TC9.py
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/modal/payment_detail_modal.robot

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/
${STEP_2_TEST_DATA}    Espresso Macchiato
${STEP_6_TEST_DATA}    $12.00 x 1
${STEP_7_TEST_DATA}    $12.00
${STEP_8_TEST_DATA}    Total: $12.00
${STEP_9_TEST_DATA}    cart (1)

*** Test Cases ***
Verify the correctness of decreasing the number of items on the "Cart" page
    menu_page.Click On Drink Element    drink_name=${STEP_2_TEST_DATA}
    menu_page.Click On Drink Element    drink_name=${STEP_2_TEST_DATA}
    menu_page.Go to Cart Page
    
    cart_page.Click Minus Button On Cart Page
    cart_page.Verify Price And Amount    ${STEP_6_TEST_DATA}
    cart_page.Verify Price    ${STEP_7_TEST_DATA}
    cart_page.Verify Total Price    ${STEP_8_TEST_DATA}
    cart_page.Verify Cart Amount    ${STEP_9_TEST_DATA}
    cart_page.Click Minus Button On Cart Page

    Close Browser
