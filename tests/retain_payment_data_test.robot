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
    [Tags]    regression    payment

    menu_page.Click On Drink Element        ${DRINK}
    menu_page.Click On Total button
    menu_page.Verify Payment Modal Appears

    payment_detail_modal.Enter Name         ${NAME}
    payment_detail_modal.Enter Email        ${EMAIL}
    payment_detail_modal.Mark Promotion Checkbox

    payment_detail_modal.Click Close Window Button
    menu_page.Verify Payment Modal Disappears

    menu_page.Click On Total button
    payment_detail_modal.Verify Name Field Value       ${NAME}
    payment_detail_modal.Verify Email Field Value      ${EMAIL}
    payment_detail_modal.Verify Checkbox Is Selected

    payment_detail_modal.Click Close Window Button
    menu_page.Go To Cart Page

    cart_page.Click On Total button
    payment_detail_modal.Verify Name Field Value       ${EMPTY}
    payment_detail_modal.Verify Email Field Value      ${EMPTY}
    payment_detail_modal.Verify Checkbox Is Not Selected
