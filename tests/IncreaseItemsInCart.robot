*** Settings ***
Documentation     Verify that user can increase the number of items in the Cart
Library           SeleniumLibrary
Library            ../src/CartPage.py

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/
${ESPRESSO_MACCHIATO}    Espresso Macchiato

*** Test Cases ***
Increase Items Number In Cart
    Open Browser         ${URL}             ${BROWSER}
    Go To Menu Page
    Sleep    time_=1
    Click Drink    drink_name=Espresso Macchiato
    Sleep    time_=1
    Go To Cart Page
    Sleep    time_=1
    Equal Cart    expected_data=cart (1)
    Equal Value Of The Item    expected_data=$12.00 x 1
    Equal Total Price    expected_price=$12.00
    Equal Total    expected_data=Total: $12.00
    Click Plus Button
    Sleep    time_=1
    Equal Cart    expected_data=cart (2)
    Equal Value Of The Item    expected_data=$12.00 x 2
    Equal Total Price    expected_price=$24.00
    Equal Total    expected_data=Total: $24.00
    Close Browser
