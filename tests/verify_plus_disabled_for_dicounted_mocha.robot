*** Settings ***
Documentation    Verify '+' button is disabled for '(Discounted) Mocha' in the Cart Page 
Library          SeleniumLibrary
Resource    ../src/resources/common.robot
Resource    ../src/resources/component/lucky_day_popup.robot
Resource    ../src/resources/pages/cart_page.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***
Increase Items Number In Cart
    [Documentation]    Verify '+' button is disabled for '(Discounted) Mocha' in the Cart Page
    [Tags]    bug
    Add Three Items To Trigger Popup
    Verify Popup Appears
    Click Yes On Successful Popup
    Go To Cart Page
    Click Plus Button On Cart Page
    ${Count}=    Get Cart Amount
    Should Be Equal    ${Count}    4
