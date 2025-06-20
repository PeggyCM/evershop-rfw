*** Settings ***
Library  SeleniumLibrary
Library    Collections
#suite setup : contient les actions à exécuter avant une suite de tests
Suite Setup    Open Browser    http://localhost:3000/admin/login    chrome 
#suite Teardown : contient les actions à exécuter après une suite de tests
Suite Teardown     Close Browser
