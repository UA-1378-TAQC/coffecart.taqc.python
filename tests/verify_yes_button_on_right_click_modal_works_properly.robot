*** Settings ***
Documentation    Verify "Yes" Button on right-click modal works and adds item to cart
Library          SeleniumLibrary
Resource         ../src/resources/common.robot
Resource         ../src/resources/pages/menu_page.robot

Test Setup       Open Browser To Menu Page
Test Teardown    Teardown Browser

*** Variables ***
${DRINK_1}              Espresso
${DRINK_2}              Flat White
${MODAL_XPATH}          //*[@id="app"]/dialog
${NO_BUTTON_XPATH}      //*[@id="app"]/dialog/form/button[2]
${YES_BUTTON_XPATH}     //*[@id="app"]/dialog/form/button[1]

*** Test Cases ***
Verify "Yes" Button On Right-Click Modal
    [Documentation]    Verify "Yes" Button On Right-Click Modal adds item to cart and modal closes

    Wait Until Element Is Visible    ${DRINK_NAMES_LIST_XPATH}
    ${total_before}=    Get Text    ${TOTAL_BUTTON_XPATH}

    Open Context Menu On Drink    ${DRINK_1}
    Wait Until Element Is Visible    ${MODAL_XPATH}
    Element Should Be Visible    ${YES_BUTTON_XPATH}

    ${initial_color}=    Get Yes Button Color    ${YES_BUTTON_XPATH}
    Mouse Over    ${YES_BUTTON_XPATH}
    ${hover_color}=    Get Yes Button Color    ${YES_BUTTON_XPATH}
    Should Not Be Equal As Strings    ${initial_color}    ${hover_color}

    Click Element    xpath=${YES_BUTTON_XPATH}
    Wait Until Element Is Not Visible    ${MODAL_XPATH}

    ${total_after_first}=    Get Text    ${TOTAL_BUTTON_XPATH}
    Should Not Be Equal As Strings    ${total_before}    ${total_after_first}

    Open Context Menu On Drink    ${DRINK_2}
    Wait Until Element Is Visible    ${MODAL_XPATH}
    Element Should Be Visible    ${YES_BUTTON_XPATH}
    Click Element    xpath=${YES_BUTTON_XPATH}
    Wait Until Element Is Not Visible    ${MODAL_XPATH}

    ${total_after_second}=    Get Text    ${TOTAL_BUTTON_XPATH}
    Should Not Be Equal As Strings    ${total_after_first}    ${total_after_second}
