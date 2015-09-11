#include "Etudiant.hpp"


#include <iostream>
#include <fstream>
#include <string>

int Etudiant::m_tailleClasse=0;

Etudiant::Etudiant(const std::string &nom,
		   const std::string &prenom
		   /*double *notes*/):
  m_nom(nom),
  m_prenom(prenom),
  //m_notes(notes),
  m_filename("")
{
  m_tailleClasse++;
}

void Etudiant::ajout_etudiant(const std::string &filename) const
{
  std::ofstream file;
file.open(filename.c_str(),std::ios::app);
  
  if(file)
    {
file<<m_prenom<<" "<<m_nom<<std::endl;
    }
  else
    {
      std::cout<<"Creation du fichier etudiant"<<std::endl;
file<<m_prenom<<" "<<m_nom<<std::endl;;
    }
file.close();

}
