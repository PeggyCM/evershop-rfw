*** Settings ***
Resource    ../keywords/login_keywords.robot
Resource    ../../ressources/variables.robot
Resource    ../../ressources/constantes.robot
Resource    ../../ressources/librairies.robot

*** Keywords ***
Creer des categories
    Cliquer sur le bouton categorie
    Cliquer sur le bouton new categorie
    Saisir les variables de la nouvelle categorie
    Selectionner une categorie parent
    Cocher les boutons radio de la categorie
    Sauver la categorie    ${CATEGORY_NAME}
    
Cliquer sur le bouton categorie
    # Attente que le lien contenant "Categories" soit visible
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Categories')]  
    # Clique sur le lien contenant "Categories"
    Click Element    xpath=//a[contains(text(), 'Categories')]  
    Wait Until Page Contains    categories

Cliquer sur le bouton new categorie
    Wait Until Element Is Enabled    css=a.button.primary
    Click Element    css=a.button.primary
    Wait Until Page Contains    Create a new category

Saisir les variables de la nouvelle categorie    
    Saisir le nom de la categorie    ${CATEGORY_NAME}
    Saisir l'url unique de la categorie
    Saisir metaTitle de la categorie
    Saisir metakeywords de la categorie
    Saisir meta_description de la categorie
    Telecharger une photo de la categorie
   
Saisir le nom de la categorie
    [Arguments]    ${nom}
    Input Text    id=name     ${nom}    
Saisir l'url unique de la categorie
    Input Text    id=urlKey   ${URL_KEY}${CATEGORY_NAME}    
Saisir metaTitle de la categorie
    Input Text    id=metaTitle    ${METATITLE}
Saisir metakeywords de la categorie
    Input Text    id=metakeywords    ${METAKEYWORDS}
Saisir meta_description de la categorie
    Input Text    id=meta_description    ${METADESCRIPTION}
Selectionner une categorie parent
    Wait Until Element Is Enabled    css=a.text-interactive
    Scroll Element Into View    css=a.text-interactive
    Click Element    css=a.text-interactive
    Wait Until Element Is Visible    xpath=//a[text()='Femme']    timeout=5s
    Scroll Element Into View        xpath=//a[text()='Femme']
    Click Element                   xpath=//a[text()='Femme']
       
Telecharger une photo de la categorie
    Choose File    css=input[type='file']    ${FILE_PATH}
    # Attendre que l'image apparaisse ou que le bouton "Enregistrer" soit activé
    Wait Until Element Is Visible    css=.category-image    timeout=5s
    
Cocher les boutons radio de la categorie
    Select Radio Button    status     1
    Select Radio Button    include_in_nav    1
    Select Radio Button    show_products    1

Sauver la categorie
    [Arguments]    ${nom}
    Click Button    css=button.button.primary
    Verifier le toast success
    Wait Until Page Contains    Editing ${nom}
    log     Editing ${nom}    

Verifier le toast success
    Wait Until Element Is Visible    css=.Toastify__toast   timeout=10s
    Element Should Contain    css=.Toastify__toast    Category saved successfully!
    Wait Until Element Is Not Visible    css=.Toastify__toast    timeout=10s

    