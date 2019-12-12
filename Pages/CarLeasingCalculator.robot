*** Settings ***
Library     Selenium2Library
Resource    ../GlobalResources/CustomSeleniumKeywords.robot
Resource    ../GlobalResources/Test_data.robot

*** Variables ***
#Texts
${CarLeasingCalculator_URL}     https://www.seb.ee/eng/loan-and-leasing/leasing/car-leasing#calculator
@{TitleCarLeasingCalculator}    Car leasing | SEB
@{TypeOfLease}                  Type of lease
@{TypeOfLease_1}                Operating lease
@{TypeOfLease_2}                Financial lease
@{TypeOfLease_3}                Financial lease without VAT

@{PriceOfTheVehicle}            Price of the vehicle
@{Downpayment}                  Downpayment
@{ContractPeriod}               Contract period
@{InterestRate}                 Interest rate
@{ResidualValue}                Residual value
@{MonthlyPayment}               Monthly payment
@{Comparison}                   Comparison
@{TableTypeValue_OL}            OL
@{TableTypeValue_FL}            FL
@{TableTypeValue_HP}            HP

@{TypeOfLease_3}            xpath=//[(@class='t -label-installments-payment')
@{I_Agree_b}                xpath=//*[contains(span, 'I agree')]
@{Add_To_comparison_b}      xpath=//*[contains(span, 'Add to comparison')]
@{Schedule_b}               xpath=//*[contains(span, 'Schedule')]
@{TypeOfLease_1_id}         xpath=//*[contains(id,'calc08-type01')]
@{TypeOfLease_2_id}         xpath=//*[contains(id,'calc08-type02')]
@{TypeOfLease_3_id}         xpath=//*[contains(id,'calc08-type03')]
@{PriceOfTheVehicle_id}     xpath=//*[contains(id,'calc08-sum')]
@{Downpayment_id}           xpath=//*[contains(id,'calc08-deposit')]
@{MonthlyPayment_id}        xpath=//*[contains(id,'monthly-result')]
@{TableTypeValue_OL_id}     xpath=//*[contains(title,'Operating lease ')]
@{TableTypeValue_FL_id}     xpath=//*[contains(title,'Financial lease')]
@{TableTypeValue_HP_id}     xpath=//*[contains(title,'Financial lease without VAT')]

*** Keywords ***

Open Car Leasing Calculator
    Open Specific Browser        ${CarLeasingCalculator_URL}     chrome
    Click on Element             @{I_Agree_b}
    Page Should Contain Text     @{TitleCarLeasingCalculator}

Verify main fields
    Page Should Contain Text        @{TypeOfLease}
    Page Should Contain Text        @{TypeOfLease_1}
    Page Should Contain Text        @{TypeOfLease_2}
    Page Should Contain Text        @{TypeOfLease_3}
    Page Should Contain Text        @{PriceOfTheVehicle}
    Page Should Contain Text        @{Downpayment}
    Page Should Contain Text        @{ContractPeriod}
    Page Should Contain Text        @{InterestRate}
    Page Should Contain Text        @{ResidualValue}
    Page Should Contain Text        @{MonthlyPayment}
    Page Should Contain Button      @{Add_To_comparison_b}
    Page Should Contain Button      @{Schedule_b}


Fill in the calculator
    Type Text                       @{PriceOfTheVehicle_id}     @{Price}
    Type Text                       @{Downpayment_id}           @{Percent}

Verify Monthly Payment for Operating Lease
    Click on Element                @{TypeOfLease_1_id}
    Element Should Contain Text     @{MonthlyPayment_id}  @{MonthlyPayment_Operating}

Verify Monthly Payment for Financial Lease
    Click on Element                @{TypeOfLease_2_id}
    Element Should Contain Text     @{MonthlyPayment_id}   @{MonthlyPayment_Financial}

Verify Monthly Payment for Financial Lease without VAT
    Click on Element                @{TypeOfLease_3_id}
    Element Should Contain Text     @{MonthlyPayment_id}    @{MonthlyPayment_FinancialVAT}

Verify add to comparison table for Operating Lease
    Click on Element                @{TypeOfLease_1_id}
    Click on Element                @{Add_To_comparison_b}
    Element Should Contain Text     @{TableTypeValue_OL_id}    @{TableTypeValue_OL}

Verify add to comparison table for Financial Lease
    Click on Element                @{TypeOfLease_2_id}
    Click on Element                @{Add_To_comparison_b}
    Element Should Contain Text     @{TableTypeValue_FL_id}    @{TableTypeValue_FL}

Verify add to comparison table for Financial Lease Without VAT
    Click on Element                @{TypeOfLease_2_id}
    Click on Element                @{Add_To_comparison_b}
    Element Should Contain Text     @{TableTypeValue_HP_id}    @{TableTypeValue_HP}