*** Settings ***
Documentation     Verify Lucky Day popup behavior without interaction
Library           SeleniumLibrary
Resource          ../src/resources/component/lucky_day_popup.robot
Resource          ../src/resources/common.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***
Verify "Lucky Day" Popup Behavior Without Interaction
    [Documentation]    Verify popup appears/disappears without clicking buttons

    Add Three Items To Trigger Popup
    Verify Popup Appears
    Click On Drink Element After Lucky Day PopUP    ${ESPRESSO}
    Verify Popup Disappears Automatically
    Click On Drink Element    ${ESPRESSO_MACCHIATO}
    Click On Drink Element   ${CAPPUCCINO}
    Verify Popup Appears
