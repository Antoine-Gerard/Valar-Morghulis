#include "Individu.hxx"
#include <stdio.h>

#include<iostream>

// Illustration de l'utilisation de la classe Individu

const int TAILLE=3;

int main(int, char **){

  Individu indiv("1245",
		 "Paul",
		 "Ochon",
                 30,
                 2,
                 1907,
                 "Ramoneur");

 std::cout<<indiv.obtenirNom()<<std::endl;
 
 Individu *tableau[TAILLE];
   
    
  // Appel d'une méthode de classe :   
  printf("Taille de la population : %d \n", Individu::obtenirNombrePersonne());
  
  printf("Nom du premier individu        : %s\n", indiv.obtenirNom());
  printf("Profession du premier individu : %s\n", indiv.obtenirProfession());
  
  indiv.modifierProfession("Cordonnier");
  
  printf("Profession du premier individu apres changement : %s\n", indiv.obtenirProfession());
  
  tableau[0]=new Individu("1586",
			  "Bon",
			  "Jean",
			  1,
			  1,
			  2000);
			 
                            
  tableau[1]=new Individu("126",
                          "Heur",
                          "Ramon",
                          31,
                          9,
                          1985,
                          "Ecrivain");
                        
  tableau[2]=&indiv;
                          
  printf("Taille de la population : %d \n", Individu::obtenirNombrePersonne());
  
  for (int compteur=0;
       compteur<TAILLE;
       compteur++)
  {
    printf("Informations concernant l'individu #%d\n",compteur);
    printf("  Sécu                : %s\n",tableau[compteur]->obtenirSecu());
    printf("  Nom                 : %s\n",tableau[compteur]->obtenirNom());
    printf("  Prénom              : %s\n",tableau[compteur]->obtenirPrenom());
    printf("  Profession          : %s\n",tableau[compteur]->obtenirProfession());
    printf("  Date de naissance   : %s\n",tableau[compteur]->obtenirDateDeNaissance());
  }
  
  puts("Destruction des 2 derniers individus");
  
  delete tableau[0];
  delete tableau[1];
  
  printf("Taille de la population : %d \n", Individu::obtenirNombrePersonne());
  
  return 0;
                 
  }

  /*#include "Individu.hxx"
#include <stdio.h>

// Illustration de l'utilisation de la classe Individu

const int TAILLE=3;

int main(int, char **)
{
  Individu indiv("124",
                 "Ochon",
                 "Paul",
                 30,
                 2,
                 1907,
                 "Ramoneur");
                 
  Individu *tableau[TAILLE];
   
    
  // Appel d'une méthode de classe :   
  printf("Taille de la population : %d \n", Individu::ObtenirTaillePopulation());
  
  printf("Nom du premier individu        : %s\n", indiv.obtenirNom());
  printf("Profession du premier individu : %s\n", indiv.obtenirProfession());
  
  indiv.modifierProfession("Cordonnier");
  
  printf("Profession du premier individu apres changement : %s\n", indiv.obtenirProfession());
  
  tableau[0]=new Individu("125",
                          "Uzi",
                          "Jacques",
                          1,
                          1,
                          2000);
                          
  tableau[1]=new Individu("126",
                          "Heur",
                          "Ramon",
                          31,
                          9,
                          1985,
                          "Ecrivain");
                        
  tableau[2]=&indiv;
                          
  printf("Taille de la population : %d \n", Individu::ObtenirTaillePopulation());
  
  for (int compteur=0;
       compteur<TAILLE;
       compteur++)
  {
    printf("Informations concernant l'individu #%d\n",compteur);
    printf("  Sécu                : %s\n",tableau[compteur]->obtenirSecu());
    printf("  Nom                 : %s\n",tableau[compteur]->obtenirNom());
    printf("  Prénom              : %s\n",tableau[compteur]->obtenirPrenom());
    printf("  Profession          : %s\n",tableau[compteur]->obtenirProfession());
    printf("  Date de naissance   : %s\n",tableau[compteur]->obtenirDateDeNaissance());
  }
  
  puts("Destruction des 2 derniers individus");
  
  delete tableau[0];
  delete tableau[1];
  
  printf("Taille de la population : %d \n", Individu::ObtenirTaillePopulation());
  
  return 0;
                 
}
*/

