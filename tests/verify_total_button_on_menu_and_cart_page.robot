*** Settings ***
Library         SeleniumLibrary
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/pages/cart_page.robot
Resource        ../src/resources/common.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${GOLDEN_COLOR}                 rgb(218, 165, 32)
${ESPRESSO_DRINK}               Espresso

*** Test Cases ***
Test Total Button On Menu And Cart Pages
    [Documentation]    Verify the functioning of the "Total" button on "Menu" and "Cart" pages.

    Click On Drink Element    ${ESPRESSO_DRINK}
    Hover Over Total Button
    Verify Total Button Hover Color    ${GOLDEN_COLOR}
    Verify Cart Preview Is Displayed

    Click On Total Button On Menu Page
    Verify Payment Modal Appears On Menu Page
    Close Modal Window On Menu Page

    Go To Cart Page

    Hover Over Total Button On Cart Page
    Verify Total Button Hover Color    ${GOLDEN_COLOR}

    Click On Total Button On Cart Page
    Verify Payment Modal Appears On Cart Page
    Close Modal Window On Cart Page
