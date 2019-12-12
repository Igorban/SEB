*** Settings ***
Library     Selenium2Library
Resource    ../GlobalResources/CustomSeleniumKeywords.robot
Resource    ../GlobalResources/Test_data.robot

*** Variables ***
#Texts
${LeasingCalculator_URL}     https://www.seb.lv/eng/loan-and-leasing/leasing/leasing-calculator
@{TitleLeasingCalculator}    Leasing calculator | SEB banka

@{I_Agree_b}                        xpath=//*[contains(span, 'I agree')]
@{Calculate_b}                      id:button.btn.btn-dark
@{Purchase_value_id}                xpath=//*[@id="f-summa"]
@{Leasing_financing_amount_id}      xpath=//*[contains(span, 'finance_sum)]

*** Keywords ***
Open Leasing Calculator
    Open Specific Browser        ${LeasingCalculator_URL}     chrome
    Click on Element             @{I_Agree_b}

Verify Leasing Calculator
    Page Should Contain Text     @{TitleLeasingCalculator}

Fill in Leasing Calculator
    Type Text                    @{Purchase_value_id}     @{Purchase_value}
    Click on Element             @{Calculate_b}

Verify Leasing Financing Amount Formula
    Element Should Contain Text     @{Leasing_financing_amount_id}  @{Leasing_financing_amount}