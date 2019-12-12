*** Settings ***
Library     Selenium2Library
Resource    ../Pages/CarLeasingCalculator.robot

*** Test Cases ***
Verify car leasing calculator
    Open Car Leasing Calculator
    Verify main fields

Verify monthly payment for different types of lease
    Open Car Leasing Calculator
    Fill in the calculator
    Verify Monthly Payment for Operating Lease
    Verify Monthly Payment for Financial Lease
    Verify Monthly Payment for Financial Lease without VAT

Verify add to comparison table
    Open Car Leasing Calculator
    Fill in the calculator
    Verify add to comparison table for Operating Lease
    Verify add to comparison table for Financial Lease
    Verify add to comparison table for Financial Lease Without VAT

