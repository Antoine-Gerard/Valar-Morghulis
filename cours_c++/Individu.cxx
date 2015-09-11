#include "Individu.hxx"
#include "Util.hxx"

#include <string.h>


int Individu::m_taillePopulation=0;

const char Individu::Etudiant[9]="Etudiant";

Individu::Individu(const char *numSecu,
		   const char *nom,
		   const char *prenom,
		   int jour,
		   int mois,
		   int annee,
		   const char *Profession) :
  m_secu(RecopieChaine(numSecu)),
  m_nom(RecopieChaine(nom)),
  m_prenom(RecopieChaine(prenom)),
  m_jour(jour),
  m_mois(mois),
  m_annee(annee),
  m_profession(RecopieChaine(Profession)){
  
  m_taillePopulation++;
  
}

Individu::~Individu(void) {
  delete [] m_secu ;
  delete [] m_nom ;
  delete [] m_prenom;
  delete [] m_profession;

  m_taillePopulation--;
}

void Individu::modifierProfession(const char *nouvelleProfession)
{
  // On ne recopie que si nouvelleProfession != 0 et
  // l'intitule de la profession est different
  if (nouvelleProfession && strcmp(nouvelleProfession, m_profession))
  {
    delete [] m_profession;
    m_profession = RecopieChaine(nouvelleProfession);
  }
}
/*  
 //---------------------------------------------------------------------------

#include "Individu.hxx"
#include "Util.hxx"

#include <string.h>

int Individu::TaillePopulation_=0;

const char Individu::ETUDIANT[9]="Etudiant";

Individu::Individu( const char *saSecu,
                    const char *sonNom,
                    const char *sonPrenom,
                    int         sonJourDeNaissance,
                    int         sonMoisDeNaissance,
                    int         sonAnneeDeNaissance,
                    const char *saProfession) :

                    secu_(RecopieChaine(saSecu)),
                    nom_(RecopieChaine(sonNom)),
                    prenom_(RecopieChaine(sonPrenom)),
                    jour_(sonJourDeNaissance),
                    mois_(sonMoisDeNaissance),
                    annee_(sonAnneeDeNaissance),
                    profession_(RecopieChaine(saProfession))
{
  TaillePopulation_++;
};

Individu::~Individu(void)
{
  delete [] secu_;

  delete [] nom_;
  delete [] prenom_;

  delete [] profession_;

  TaillePopulation_--;
}

void Individu::modifierProfession(const char *nouvelleProfession)
{
  // On ne recopie que si nouvelleProfession != 0 et
  // l'intitule de la profession est different
  if (nouvelleProfession && strcmp(nouvelleProfession, profession_))
  {
    delete [] profession_;
    profession_=RecopieChaine(nouvelleProfession);
  }
} 
  
*/
