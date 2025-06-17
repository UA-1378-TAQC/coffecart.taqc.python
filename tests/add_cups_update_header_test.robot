*** Settings ***
Documentation     Verify that clicking on multiple coffee cup icons adds them to the cart and updates the header counter
Library           SeleniumLibrary
Resource          ../src/resources/common.robot
Resource          ../src/resources/pages/menu_page.robot
Resource          ../src/resources/component/header_component.robot

Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${EXPECTED_INITIAL_COUNTER}     0
${TOTAL_CUPS_TO_CLICK}          5
${CART_COUNTER_ERROR_MSG}       Cart count mismatch after pressing cup #

*** Test Cases ***
Verification of Adding Coffee Cups To Cart Updates The Header Counter
    [Documentation]    Verify that adding coffee cups updates the counter

    ${initial}=    Get Cart Counter Value
    Should Be Equal As Integers    ${initial}    ${EXPECTED_INITIAL_COUNTER}

    FOR    ${index}    IN RANGE    ${TOTAL_CUPS_TO_CLICK}
        Click Coffee Cup Icon By Index    ${index}
        ${expected}=    Evaluate    ${initial} + ${index} + 1
        ${actual}=      Get Cart Counter Value
        ${step}=        Evaluate    ${index} + 1
        Should Be Equal As Integers    ${actual}    ${expected}    msg=${CART_COUNTER_ERROR_MSG}${step}
    END
