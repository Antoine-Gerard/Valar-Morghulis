#ifndef __ETUDIANT_HXX__
#define __ETUDIANT_HXX__

#include <string>

class Etudiant{

public:

  Etudiant(const std::string &nom, const std::string &prenom);

  const std::string sonNom() const
  {
    return m_nom;
  }

  const std::string sonPrenom() const
  {
    return m_prenom;
  }
  
  void ajout_etudiant(const std::string &filename) const;

private:
  const std::string m_nom;
  const std::string m_prenom;
  const std::string m_filename;
  //double *m_notes;
  static int m_tailleClasse;
};


#endif //__ETUDIANT_HXX__
