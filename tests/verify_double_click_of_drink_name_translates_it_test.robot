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

*** Keywords ***
Verify Translation For Drink Element
    [Arguments]    ${element}
    ${original_name}=    Get Drink Name From Element    ${element}
    Double Click On Drink Element    ${element}
    ${translated_name}=    Get Translated Drink Name From Element    ${element}
    ${expected_translation}=    Get From Dictionary    ${DRINK_TRANSLATIONS}    ${original_name}
    Should Be Equal As Strings    ${translated_name}    ${expected_translation}

*** Test Cases ***
Verify All Drink Translations After Double Click
    ${elements}=    Get Drink Name Elements
    FOR    ${element}    IN    @{elements}
        Verify Translation For Drink Element    ${element}
    END
