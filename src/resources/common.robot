*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://coffee-cart.app

*** Keywords ***
Open Browser To Menu Page
    Open Browser     ${URL}    ${BROWSER}
    Maximize Browser Window

Teardown Browser
    Close Browser