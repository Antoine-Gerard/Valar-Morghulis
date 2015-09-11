#include "complexPolaire.hxx"
#include <stdio.h>

void ComplexePol::modifierCartesien(double x, double y){
  m_mode=sqrt(x*x+y*y);
  m_arg=atan2(x,y);
}

void ComplexePol::modifierPolaire(double mode, double argument){
  m_mode=mode;
  m_arg=argument;
}

void ComplexePol::printCartesien() const{
  printf("%6.2f+%6.2fi",re(),im());
}

void ComplexePol::printPolaire() const{
  printf("%6.2fexp(i%6.2f)",mode(),arg());
}
    
