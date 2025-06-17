*** Settings ***
Documentation     Verify the correctness of decreasing the number of items on the "Cart" page
Library    SeleniumLibrary
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/modal/payment_detail_modal.robot

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${STEP_2_TEST_DATA}    Espresso Macchiato
${STEP_6_TEST_DATA}    $12.00 x 1
${STEP_7_TEST_DATA}    $12.00
${STEP_8_TEST_DATA}    Total: $12.00
${STEP_9_TEST_DATA}    cart (1)

*** Test Cases ***
Verify the correctness of decreasing the number of items on the "Cart" page
    Click On Drink Element    drink_name=${STEP_2_TEST_DATA}
    Click On Drink Element    drink_name=${STEP_2_TEST_DATA}
    Go to Cart Page
    
    Click Minus Button On Cart Page
    Verify Price And Amount    ${STEP_6_TEST_DATA}
    Verify Price    ${STEP_7_TEST_DATA}
    Verify Total Price    ${STEP_8_TEST_DATA}
    Verify Cart Amount    ${STEP_9_TEST_DATA}
    Click Minus Button On Cart Page
