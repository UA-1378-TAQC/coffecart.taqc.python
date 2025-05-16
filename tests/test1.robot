*** Settings ***
Documentation     Перевірка стану порожнього кошика та обмеження кнопки замовлення при порожньому кошику
Library           SeleniumLibrary

*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/

*** Test Cases ***
Перевірка порожнього кошика та відсутності кнопки "Total"
    [Documentation]    Перевіряє відображення порожнього кошика та відсутність кнопки "Total"
    Open Browser         ${URL}             ${BROWSER}
    Close Browser