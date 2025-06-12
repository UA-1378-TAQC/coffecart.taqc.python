*** Settings ***
Documentation     [TC7] Verification of pop-up cart functioning (buttons +/-)
Library           SeleniumLibrary
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/menu_page.robot

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${DRINK}          Flat White
${PRICE}          18
${CURRENCY}       $
${TOTAL_1}        Total: ${CURRENCY}${PRICE}.00
${TOTAL_2}        Total: ${CURRENCY}${{2*${PRICE}}}.00
${TOTAL_0}        Total: ${CURRENCY}0.00

*** Test Cases ***
Verify Pop-up Cart Functioning With Plus And Minus Buttons
    [Tags]    regression    cart

    menu_page.Click On Drink Element    ${DRINK}
    menu_page.Verify Total Button Text  ${TOTAL_1}

    Hover Over Total Button On Menu Page

    menu_page.Click Plus Button
    menu_page.Verify Total Button Text   ${TOTAL_2}

    menu_page.Click Minus Button
    menu_page.Verify Total Button Text   ${TOTAL_1}

    menu_page.Click Minus Button
    menu_page.Verify Total Button Text   ${TOTAL_0}
