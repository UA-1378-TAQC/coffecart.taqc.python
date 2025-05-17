*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${INPUT_NAME_XPATH}                //div[@class='modal']/descendant::input[@id='name']
${INPUT_EMAIL_XPATH}               //div[@class='modal']/descendant::input[@id='email']
${PAYMENT_SUBMIT_BUTTON_XPATH}     //div[@class='modal']/descendant::button[@id='submit-payment']

*** Keywords ***
Enter Name 
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${INPUT_NAME_XPATH}
    Input Text    ${INPUT_NAME_XPATH}    ${name}

Enter Email 
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${INPUT_EMAIL_XPATH}
    Input Text    ${INPUT_EMAIL_XPATH}    ${email}

Click Submit Button
    Wait Until Element Is Enabled    ${PAYMENT_SUBMIT_BUTTON_XPATH}
    Click Button    ${PAYMENT_SUBMIT_BUTTON_XPATH}

