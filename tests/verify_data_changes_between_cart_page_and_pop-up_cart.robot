*** Settings ***
Documentation     Verification of data changes synchronization between cart page and pop-up cart
Library    SeleniumLibrary
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/pages/menu_page.robot

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${STEP_2_TEST_DATA}    Flat White
${STEP_3_TEST_DATA}    Total: $18.00
${STEP_3_1_TEST_DATA}    Flat White
${STEP_3_2_TEST_DATA}    x 1
${STEP_4_TEST_DATA}    Total: $36.00
${STEP_4_1_TEST_DATA}    Flat White
${STEP_4_2_TEST_DATA}    x 2
${STEP_9_TEST_DATA}    $18.00 x 1

*** Test Cases ***
Verification of data changes synchronization between cart page and pop-up cart
    Click On Drink Element    drink_name=${STEP_2_TEST_DATA}
    Hover Over Total Button
    Verify Total Button Text    ${STEP_3_TEST_DATA}
    Verify Cart On Menu Page    ${STEP_3_1_TEST_DATA}    ${STEP_3_2_TEST_DATA}
    Go to Cart Page
    Click Plus Button On Cart Page
    Go to Menu Page
    Hover Over Total Button
    Verify Total Button Text    ${STEP_4_TEST_DATA}
    Verify Cart On Menu Page    ${STEP_4_1_TEST_DATA}    ${STEP_4_2_TEST_DATA}
    Click Minus Button
    Verify Total Button Text    ${STEP_3_TEST_DATA}
    Verify Cart On Menu Page    ${STEP_3_1_TEST_DATA}    ${STEP_3_2_TEST_DATA}
    Go to Cart Page
    Verify Price And Amount    ${STEP_9_TEST_DATA}
    