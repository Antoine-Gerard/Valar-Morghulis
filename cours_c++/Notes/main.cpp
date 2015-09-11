#include "Etudiant.hpp"

#include <string>

int main(int, char**){
  Etudiant etu1("Gérard",
		"Antoine");

  Etudiant etu2("Deram",
		"Maxime");

  etu1.ajout_etudiant("Etudiant.txt");
  etu2.ajout_etudiant("Etudiant.txt");
  
  return 0;
}
