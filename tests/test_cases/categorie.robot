*** Settings ***
Resource    ../keywords/crea_categorie_keywords.robot
resource    ../keywords/modif_categorie_keywords.robot
Resource    ../../ressources/librairies.robot
Resource    ../../ressources/variables.robot
Resource    ../../ressources/constantes.robot

#suite setup : contient les actions à exécuter avant une suite de tests
Suite Setup    initialiser l'environnement    
#suite Teardown : contient les actions à exécuter après une suite de tests
Suite Teardown     clore environnement

*** Test Cases ***
Test Création de Catégorie
    Creer des categories
Test Modification Categorie
    Modifier des categories
    #Supprimer des categories

#Test Création de produits
    #Creer des produits
    #Modifier des produits
    #Supprimer des produits

#Créer une collection pour le paiement

#Test de paiement

    





