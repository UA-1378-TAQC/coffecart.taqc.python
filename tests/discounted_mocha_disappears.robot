*** Settings ***
Documentation     Verify that (Discounted) Mocha disappears after removing other drinks via 'x' button in Cart Page
Library           SeleniumLibrary
Resource          ../src/resources/pages/menu_page.robot
Resource          ../src/resources/pages/cart_page.robot
Resource          ../src/resources/component/lucky_day_popup.robot
Resource          ../src/resources/common.robot
Test Setup        Open Browser To Menu Page
Test Teardown     Teardown Browser

*** Variables ***
${DISCOUNTED_MOCHA}    (Discounted) Mocha
${ESPRESSO}            Espresso
${EMPTY_MESSAGE}       No coffee, go add some.

*** Test Cases ***
Verify Discounted Mocha Disappears After Removing Other Drinks
    [Tags]    bug

    Click On Drink Element    ${ESPRESSO}
    Click On Drink Element    ${ESPRESSO}
    Click On Drink Element    ${ESPRESSO}

    Verify Lucky Day Popup Appears
    Click Yes On Successful Popup

    Verify Cart Link Equal    cart (4)

    Go to Cart Page

    Verify Drink Is In Cart    ${DISCOUNTED_MOCHA}
    Verify Drink Is In Cart    ${ESPRESSO}

    Remove All From Cart By Drink Name    ${ESPRESSO}

    ${mocha_visible}=    Run Keyword And Return Status    Verify Drink Is In Cart    ${DISCOUNTED_MOCHA}
    Run Keyword If    ${mocha_visible}    Fail    Mocha should disappear but it is still in cart

    Total Button Should Not Be Visible

    Cart Page Should Contain Empty Text Element

    Verify Cart Link Equal    cart (0)
    