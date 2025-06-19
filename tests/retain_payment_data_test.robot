*** Settings ***
Documentation     Verify that Payment Details Modal keeps data after closing via “X” on Menu Page,
...               but clears inputs after navigation to Cart Page.
Library           SeleniumLibrary
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/menu_page.robot
Resource          ../src/resources/pages/cart_page.robot
Resource          ../src/resources/modal/payment_detail_modal.robot

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${DRINK}          Flat White
${NAME}           TestUser
${EMAIL}          testuser@gmail.com

*** Test Cases ***
Retain Modal Data On Menu Page And Reset On Cart Page

    Click On Drink Element        ${DRINK}
    Click On Total button On Menu Page
    Verify Payment Modal Appears On Menu Page

    Enter Name         ${NAME}
    Enter Email        ${EMAIL}
    Mark Promotion Checkbox

    Click Close Window Button
    Verify Payment Modal Disappears

    Click On Total button On Menu Page
    Verify Name Field Value       ${NAME}
    Verify Email Field Value      ${EMAIL}
    Verify Checkbox Is Selected

    Click Close Window Button
    Go To Cart Page

    Click On Total button On Cart Page
    Verify Name Field Value       ${EMPTY}
    Verify Email Field Value      ${EMPTY}
    Verify Checkbox Is Not Selected
