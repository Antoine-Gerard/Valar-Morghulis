#include <math.h>
#include <iostream>
#include "complexCartesien.hxx"

int main(int, char**){

  double a,b,c;
  std::cout<<"Bonjour. Ce programme va calculer les racines réelles de votre polynome du second degré ax^2+bx+x."<<std::endl;
  std::cout<<"Entrez a :"<<std::endl;
  std::cin>>a;
  while(a==0)
    {
      std::cout<<"a doit être différent de 0"<<std::endl;
      std::cin>>a;
    }
  std::cout<<"Entrez b :"<<std::endl;
  std::cin>>b;
  std::cout<<"Entrez c :"<<std::endl;
  std::cin>>c;

  if((b*b-4*a*c)>0)
    {
      std::cout<<"Racine 1: "<<(-b+sqrt(b*b-4*a*c))/(2*a)<<" Racine 2: "<<(-b-sqrt(b*b-4*a*c))/(2*a)<<std::endl;
      return 0;
    }

  else if((b*b-4*a*c)==0)
    {
      std::cout<<"Racine double: "<<-b/(2*a)<<std::endl;
      return 0;
    }
  else
    {
      ComplexeCart Z1, Z2;
      std::cout<<"Aucune racine réelle"<<std::endl;
      Z1.modifierCartesien(-b/(2*a),sqrt(-(b*b-4*a*c))/(2*a));
      Z2.modifierCartesien(-b/(2*a),-sqrt(-(b*b-4*a*c))/(2*a));
      std::cout<<"Il existe cependant des racines complexes. Z1= ";
      Z1.printCartesien();
      std::cout<<std::endl;
      std::cout<<"Z2= ";
      Z2.printCartesien();
      std::cout<<std::endl;
      return 0;
    }
}
