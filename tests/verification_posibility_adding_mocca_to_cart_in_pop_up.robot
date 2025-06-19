*** Settings ***
Documentation     Data-driven test: Verify "Lucky Day" popup and adding Mocha to cart
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/pages/cart_page.robot
Resource    ../src/resources/Data/drinks.robot
Resource    ../src/resources/component/lucky_day_popup.robot
Resource    ../src/resources/common.robot
Library    BuiltIn
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
@{DRINK SET 1}    Espresso    Mocha    Cappuccino
@{DRINK SET 2}    Espresso   Flat White
@{DRINK SET 3}    Americano   Espresso   Cafe Breve
@{DRINK SET 4}    Espresso    Americano
@{DRINK SET 5}    Cappuccino   Espresso

*** Test Cases ***
Lucky Day Pop-up Test Set 1
    [Template]    Lucky Day Pop-up Appearing For Drink Set
    @{DRINK SET 1}
    @{DRINK SET 2}
Lucky Day Pop-up Test Set 2
    [Template]    Lucky Day Pop-up Appearing For Drink Set
    @{DRINK SET 3}
    @{DRINK SET 4}
    @{DRINK SET 5}
