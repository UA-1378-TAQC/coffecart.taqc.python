*** Settings ***
Library         SeleniumLibrary
Library           String

*** Keywords ***
Get Drink Full Text
    [Arguments]    ${element}
    ${text}=    Get Text    ${element}
    RETURN    ${text}

Get Drink Name From Full Text
    [Arguments]    ${full_text}
    ${name_part}=    Split String    ${full_text}    $
    ${name}=    Strip String    ${name_part[0]}
    RETURN    ${name}

Get Drink Name From Element
    [Arguments]    ${element}
    ${full_text}=    Get Drink Full Text    ${element}
    ${name}=    Get Drink Name From Full Text    ${full_text}
    RETURN    ${name}

Double Click On Drink Element
    [Arguments]    ${element}
    Mouse Over    ${element}
    Double Click Element    ${element}

Get Translated Drink Name From Element
    [Arguments]    ${element}
    ${full_text}=    Get Drink Full Text    ${element}
    ${parts}=    Split String    ${full_text}    $
    ${translation}=    Strip String    ${parts[0]}
    RETURN    ${translation}
