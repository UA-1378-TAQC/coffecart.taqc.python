*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${INPUT_NAME_XPATH}                //div[@class='modal']/descendant::input[@id='name']
${INPUT_EMAIL_XPATH}               //div[@class='modal']/descendant::input[@id='email']
${PAYMENT_SUBMIT_BUTTON_XPATH}     //div[@class='modal']/descendant::button[@id='submit-payment']
${WINDOW_CLOSE_BUTTON_XPATH}       //div[@class='modal']/descendant::button[@class='close']

*** Keywords ***
Enter Name 
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${INPUT_NAME_XPATH}
    Input Text    ${INPUT_NAME_XPATH}    ${name}

Clear Name 
    Clear Element Text    ${INPUT_NAME_XPATH}

Enter Email 
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${INPUT_EMAIL_XPATH}
    Input Text    ${INPUT_EMAIL_XPATH}    ${email}

Click Submit Button
    Wait Until Element Is Enabled    ${PAYMENT_SUBMIT_BUTTON_XPATH}
    Click Button    ${PAYMENT_SUBMIT_BUTTON_XPATH}

Click Close Window Button
    Wait Until Element Is Enabled    ${WINDOW_CLOSE_BUTTON_XPATH}
    Click Button    ${WINDOW_CLOSE_BUTTON_XPATH}

Verify Payment Modal Is Visible
    Element Should Be Visible    ${INPUT_NAME_XPATH}

Verify Name Validation Message
    [Arguments]    ${expected_message}
    ${element}=    Get WebElement    ${INPUT_NAME_XPATH}
    ${actual_message}=    Get Element Attribute    ${INPUT_NAME_XPATH}    validationMessage
    Should Be Equal    ${actual_message}    ${expected_message}