*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${BROWSER_HEADLESS}    headlesschrome
${URL}        https://coffee-cart.app
${SCREENSHOOT_LIBRARY}    ../coffecart.taqc.python/tests/results

*** Keywords ***
Open Browser To Menu Page Headless
    Open Browser     ${URL}    ${BROWSER}
    Set Screenshot Directory    path=${SCREENSHOOT_LIBRARY}
    Maximize Browser Window

Open Browser To Menu Page
    Open Browser     ${URL}    ${BROWSER_HEADLESS}
    Set Screenshot Directory    path=${SCREENSHOOT_LIBRARY}
    Maximize Browser Window

Teardown Browser
    Close Browser
