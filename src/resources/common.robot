*** Settings ***
Library         SeleniumLibrary

*** Variables ***
# ${BROWSER}    Chrome
${BROWSER}    headlesschrome
${URL}        https://coffee-cart.app
${SCREENSHOOT_LIBRARY}    ../coffecart.taqc.python/tests/results

*** Keywords ***
Open Browser To Menu Page
    Open Browser     ${URL}    ${BROWSER}
    Set Screenshot Directory    path=${SCREENSHOOT_LIBRARY}
    Maximize Browser Window

Teardown Browser
    Close Browser
