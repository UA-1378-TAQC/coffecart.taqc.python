*** Settings ***
Documentation     Verify "No" Button on right-click modal works and modal is functional after reload
Library           SeleniumLibrary
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/menu_page.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${DRINK_1}        Espresso
${DRINK_2}        Flat White
${MODAL_XPATH}    //*[@id="app"]/dialog
${NO_BUTTON_XPATH}    //*[@id="app"]/dialog/form/button[2]
${YES_BUTTON_XPATH}   //*[@id="app"]/dialog/form/button[1]
${CART_LINK}      cart (0)

*** Test Cases ***
Verify "No" Button On Right-Click Modal
    [Documentation]    Verify "No" Button On Right-Click Modal

    Wait Until Element Is Visible    ${DRINK_NAMES_LIST_XPATH}

    Open Context Menu On Drink    ${DRINK_1}
    Wait Until Element Is Visible    ${MODAL_XPATH}
    Element Should Be Visible    ${YES_BUTTON_XPATH}
    Element Should Be Visible    ${NO_BUTTON_XPATH}

    ${initial_color}=    Get No Button Color    ${NO_BUTTON_XPATH}
    Mouse Over    ${NO_BUTTON_XPATH}
    Sleep    0.5s
    ${hover_color}=    Get No Button Color    ${NO_BUTTON_XPATH}
    Should Not Be Equal As Strings    ${initial_color}    ${hover_color}

    Click Element    xpath=${NO_BUTTON_XPATH}
    Wait Until Element Is Not Visible    ${MODAL_XPATH}

    Verify Cart Link Equal    ${CART_LINK}
    Reload Page
    Wait Until Element Is Visible    ${DRINK_NAMES_LIST_XPATH}

    Open Context Menu On Drink    ${DRINK_2}
    Wait Until Element Is Visible    ${MODAL_XPATH}
    Element Should Be Visible    ${YES_BUTTON_XPATH}
    Element Should Be Visible    ${NO_BUTTON_XPATH}