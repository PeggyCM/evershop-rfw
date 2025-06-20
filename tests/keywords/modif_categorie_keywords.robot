*** Settings ***
Resource    ../keywords/login_keywords.robot
Resource    ../../ressources/variables.robot
Resource    ../../ressources/constantes.robot
Resource    ../../ressources/librairies.robot
Resource    ../keywords/crea_categorie_keywords.robot


*** Keywords ***
Modifier des categories
    Cliquer sur le bouton categorie
    Cliquer sur la categorie
    Saisir le nom de la categorie    ${CATEGORY_NAME_NEW}
    Sauver la categorie    ${CATEGORY_NAME_NEW}

Cliquer sur la categorie
    # Récupère tous les éléments de la liste des categories
    ${elements}=    Get WebElements    //*[contains(@class, 'hover:underline') and contains(@class, 'font-semibold')]

    FOR    ${element}    IN    @{elements}
        ${texte}=    Get Text    ${element}
        Run Keyword If    "${CATEGORY_PARENT} in ${texte} and ${CATEGORY_NAME} in ${texte}"    Click Element    ${element}
        Run Keyword If    "'femme' in ${texte} and 'sac' in ${texte}"    Exit For Loop
    END
    # Si l’élément contient "femme" et "sac", on clique dessus, puis on quitte la boucle 
    Sleep    5
   