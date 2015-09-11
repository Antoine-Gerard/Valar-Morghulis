#ifndef __INDIVIDU_HXX__
#define __INDIVIDU_HXX__

#include<stdio.h>


class Individu{

public:
  
  static const char Etudiant[9];

  Individu(const char *numSecu,
	   const char *nom,
	   const char *prenom,
	   int jour,
	   int mois,
	   int annee,
	   const char *Profession=Etudiant);

  const char *obtenirNom(void) const{
    return m_nom;
  }

  const char *obtenirPrenom(void) const{
    return m_prenom;
  }

  const char *obtenirSecu(void) const{
    return m_secu;
  }

  const char *obtenirProfession(void) const{
    return m_profession;
  }

  const char *obtenirDateDeNaissance(void) const{
    static char temp[11];
    sprintf(temp,"%02d/%02d/%4d",m_jour,m_mois,m_annee);
    return temp;
  }
  
  void modifierProfession(const char *nouvelleProfession);
  
  static int obtenirNombrePersonne() {
    return m_taillePopulation;
  }

  ~Individu(void);

private:

  char *m_nom;
  char *m_prenom;
  char *m_secu;
  int m_jour, m_mois, m_annee;
  char *m_profession;
  static int m_taillePopulation;
};

#endif //__INDIVIDU_HXX__

/*---------------------------------------------------------------------------
#ifndef __Individu_HXX__
#define __Individu_HXX__
//---------------------------------------------------------------------------

#include <stdio.h>

class Individu
{
  public:
    static const char ETUDIANT[9];


    Individu( const char *saSecu,
              const char *sonNom,
              const char *sonPrenom,
              int         sonJourDeNaissance,
              int         sonMoisDeNaissance,
              int         sonAnneeDeNaissance,
              const char *saProfession=ETUDIANT);

    const char *obtenirNom(void) const
    {
      return nom_;
    }

    const char *obtenirPrenom(void) const
    {
      return prenom_;
    }

    const char *obtenirSecu(void) const
    {
      return secu_;
    }

    const char *obtenirProfession(void) const
    {
      return profession_;
    }

    const char *obtenirDateDeNaissance(void) const
    {
      static char temp[11];
      sprintf(temp,"%02d/%02d/%4d",jour_,mois_,annee_);
      return temp;
    }
    
    void modifierProfession(const char *nouvelleProfession);
    
    ~Individu(void);

    static int ObtenirTaillePopulation()
    {
      return TaillePopulation_;
    }
    
  private:
    // Numero de securite sociale

    char * secu_;

    // Etat civil

    char * nom_;
    char * prenom_;

    // Date de naissance

    int    jour_;
    int    mois_;
    int    annee_;

    // Profession

    char * profession_;

    // Taille de la population

    static int TaillePopulation_;
}; // Ne pas l'oublier !!!

#endif
*/
