*** Settings ***
Documentation     Перевірка стану порожнього кошика та обмеження кнопки замовлення при порожньому кошику
Library           SeleniumLibrary
Library            ../src/CartPage.py

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/

*** Test Cases ***
Verify Empty Cart State
    Open Browser         ${URL}             ${BROWSER}
    Go To Cart Page
    ${message}=    Get Empty Cart Message
    Should Be Equal As Strings    ${message}    No coffee, go add some.
    Close Browser
