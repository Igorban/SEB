*** Settings ***
Library     Selenium2Library
Resource    ../Pages/LeasingCalculator.robot

*** Test Cases ***
Verify car leasing calculator
    Open Leasing Calculator
    Verify Leasing Calculator

Verify Leasing Financing Amount
    Open Leasing Calculator
    Fill in Leasing Calculator
    Verify Leasing Financing Amount Formula