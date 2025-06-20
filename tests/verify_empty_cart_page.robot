*** Settings ***
Library           SeleniumLibrary
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/cart_page.robot
Resource          ../src/resources/pages/menu_page.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***
Verify order button restriction with empty cart
    Go To Cart Page
    Cart Page Should Contain Empty Text Element
    Total Button Should Not Be Visible

    Go To Menu Page
    Total Button Should Be Visible
    