#include "complexCartesien.hxx"
#include "complexPolaire.hxx"
#include <stdio.h>

#include<iostream>

int main(int, char **){
  ComplexeCart Z1, Z2, Z3;
  Z1.modifierCartesien(0.5,0.5);
  Z2.modifierCartesien(0.5,0.5);
  printf("La partie réelle de Z est: %6.2f \n",Z1.re());
  printf("La partie imaginaire de Z est: %6.2f \n",Z1.im());
  Z1+=Z2;
  Z3=Z1+Z2;
  Z1.printCartesien();
  std::cout<<std::endl;
  Z2.printCartesien();
  std::cout<<std::endl;
  Z3.printCartesien();
  std::cout<<std::endl;
  Z3=Z2;
  Z3.printCartesien();
  std::cout<<std::endl;
}
