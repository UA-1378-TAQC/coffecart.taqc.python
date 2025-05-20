*** Settings ***
Documentation  Verification posibility adding Mocca to cart in pop-up "lucky day"
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/Data/drinks.robot
Resource    ../src/resources/component/lucky_day_popup.robot
Resource    ../src/resources/common.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser


*** Test Cases ***
Lucky Day Pop-up Appearing

    menu_page.Click On Drink Element    Espresso
    menu_page.Click On Drink Element    Mocha
    menu_page.Click On Drink Element    Cappuccino

    menu_page.Verify Lucky Day Popup Appears
    lucky_day_popup.Click Yes On Successful Popup
    lucky_day_popup.Verify Popup Disappears Automatically

    menu_page.Click On Drink Element    Espresso Macchiato
    menu_page.Click On Drink Element    Americano

    menu_page.Verify Lucky Day Popup Appears
    lucky_day_popup.Click Yes On Successful Popup
    lucky_day_popup.Verify Popup Disappears Automatically



