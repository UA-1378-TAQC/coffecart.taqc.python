*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INPUT_NAME_XPATH}                 //div[@class='modal']//input[@id='name']
${INPUT_EMAIL_XPATH}                //div[@class='modal']//input[@id='email']
${PROMO_CHECKBOX_XPATH}             //div[@class='modal']//input[@id='promotion']
${PAYMENT_SUBMIT_BUTTON_XPATH}      //div[@class='modal']//button[@id='submit-payment']
${WINDOW_CLOSE_BUTTON_XPATH}        //div[@class='modal']//button[@class='close']

*** Keywords ***
Enter Name
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${INPUT_NAME_XPATH}
    Input Text    ${INPUT_NAME_XPATH}    ${name}

Enter Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${INPUT_EMAIL_XPATH}
    Input Text    ${INPUT_EMAIL_XPATH}    ${email}

Mark Promotion Checkbox
    Wait Until Element Is Visible    ${PROMO_CHECKBOX_XPATH}
    Click Element    ${PROMO_CHECKBOX_XPATH}

Click Submit Button
    Wait Until Element Is Enabled    ${PAYMENT_SUBMIT_BUTTON_XPATH}
    Click Button    ${PAYMENT_SUBMIT_BUTTON_XPATH}

Click Close Window Button
    Wait Until Element Is Enabled    ${WINDOW_CLOSE_BUTTON_XPATH}
    Click Button    ${WINDOW_CLOSE_BUTTON_XPATH}

Verify Payment Modal Is Visible
    Element Should Be Visible    ${INPUT_NAME_XPATH}

Verify Name Field Value
    [Arguments]    ${expected}
    ${actual}=    Get Element Attribute    ${INPUT_NAME_XPATH}    value
    Should Be Equal    ${actual}    ${expected}

Verify Email Field Value
    [Arguments]    ${expected}
    ${actual}=    Get Element Attribute    ${INPUT_EMAIL_XPATH}    value
    Should Be Equal    ${actual}    ${expected}

Verify Checkbox Is Selected
    Checkbox Should Be Selected    ${PROMO_CHECKBOX_XPATH}

Verify Checkbox Is Not Selected
    Checkbox Should Not Be Selected    ${PROMO_CHECKBOX_XPATH}

Verify Error Message In Empty Name
    ${expected}=     Set Variable    Please fill
    # ${expected}=     Set Variable    Please fill out this field.
    ${actual}=    Get Validation Message From Input    ${INPUT_NAME_XPATH}     
    Should Be Equal    ${actual}    ${expected}

Get Validation Message From Input 
    [Arguments]    ${xpath}
    ${js}=    Catenate
    ...    return document.evaluate("${xpath}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.validationMessage;
    ${message}=    Execute Javascript    ${js}
    [Return]    ${message}
    