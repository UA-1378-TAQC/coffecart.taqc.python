*** Settings ***
Library         SeleniumLibrary
Resource        src/resources/pages/menu_page.robot
Resource        src/resources/pages/cart_page.robot
Resource        ../src/resources/common.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${GOLDEN_COLOR}                 rgb(218, 165, 32)
${ESPRESSO_DRINK}               Espresso
${TOTAL_BUTTON_XPATH}           //button[@class='pay']
${CART_COMPONENT_ROOT_XPATH}    //ul[@class='cart-preview show']

*** Test Cases ***
Test Total Button On Menu And Cart Pages
    [Documentation]    Verify the functioning of the "Total" button on "Menu" and "Cart" pages.

    Go To Menu Page
    Click On Drink Element    ${ESPRESSO_DRINK}

    menu_page.Hover Over Total Button On Menu Page
    Verify Total Button Hover Color    ${GOLDEN_COLOR}
    Verify Cart Preview Is Displayed

    menu_page.Click On Total Button
    menu_page.Verify Payment Modal Appears
    menu_page.Close Modal Window On Menu Page

    menu_page.Go To Cart Page

    cart_page.Hover Over Total Button On Cart Page
    Verify Total Button Hover Color    ${GOLDEN_COLOR}

    cart_page.Click On Total Button
    cart_page.Verify Payment Modal Appears
    cart_page.Close Modal Window On Cart Page


*** Keywords ***

Verify Total Button Hover Color
    [Arguments]    ${expected_color}
    ${actual_color}=    menu_page.Get CSS Property Value    ${TOTAL_BUTTON_XPATH}    color
    Should Be Equal    ${actual_color}    ${expected_color}
    ...    msg=Text color should change to ${expected_color} on hover

Verify Cart Preview Is Displayed
    Wait Until Element Is Visible    ${CART_COMPONENT_ROOT_XPATH}
    Element Should Be Visible    ${CART_COMPONENT_ROOT_XPATH}
    ...    msg=Pop-up cart should appear on hover
