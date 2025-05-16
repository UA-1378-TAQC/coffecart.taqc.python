*** Settings ***
Documentation     Verify the correctness of decreasing the number of items on the "Cart" page
Library           SeleniumLibrary
Library            ../src/TC9.py

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/

*** Test Cases ***
Verify the correctness of decreasing the number of items on the "Cart" page
    Open Browser         ${URL}             ${BROWSER}
    Go To Menu Page
    Click Drink    drink_name=Espresso Macchiato
    Click Drink    drink_name=Espresso Macchiato
    Go To Cart Page
    Click Minus Button
    Sleep    time_=1
    Equal Value Of The Item    expected_data=$12.00 x 1
    Sleep    time_=2.5
    Equal Total Price    expected_price=$12.00
    Sleep    time_=2.5
    Equal Total    expected_data=Total: $12.00
    Sleep    time_=2.5
    Equal Cart    expected_data=cart (1)
    Sleep    time_=2.5
    Click Minus Button
    Sleep    time_=1
    Close Browser
