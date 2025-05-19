*** Settings ***
Documentation  Verification posibility adding Mocca to cart in pop-up "lucky day"
Resource    ../src/resources/pages/menu_page.robot
Resource    ../src/resources/Data/drinks.robot
Resource    ../src/resources/common.robot
Suite Setup     Open Browser To App
Suite Teardown  Close Browser

*** Variables ***

*** Keywords ***
Open Browser To App
    Open Browser    ${URL}    chrome
    Maximize Browser Window


Click Drink N Times
    [Arguments]    ${drink_name}    ${times}
    FOR    ${i}    IN RANGE    ${times}
        Click On Drink Element    ${drink_name}
    END

*** Test Cases ***
Pop-up Appears After 3 Clicks On All Drinks
    FOR    ${drink}    IN    @{DRINKS}
        Log    Testing drink: ${drink}
        Click Drink N Times    ${drink}    3
        menu_page.Verify Successful Popup Appears
        successful_modal.Click Yes On Successful Popup
        Verify Popup Disappears   # Перевіряємо, що попап зник
        Run Keyword If    '${drink}' == 'Mocca'    cart_page.Verify Drink Is In Cart    Mocca
    END
