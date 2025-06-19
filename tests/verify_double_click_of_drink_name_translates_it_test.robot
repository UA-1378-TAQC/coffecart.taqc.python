*** Settings ***
Documentation     Validate double click translates drink
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/menu_page.robot
Resource          ../src/resources/data/translated_drinks.robot
Resource          ../src/resources/component/drink_component.robot
Library           SeleniumLibrary
Library           Collections
Library           String
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Test Cases ***
Verify All Drink Translations After Double Click
    ${elements}=    Get Drink Name Elements
    FOR    ${element}    IN    @{elements}
        Verify Translation For Drink Element    ${element}
    END
