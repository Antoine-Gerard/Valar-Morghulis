#include "complexCartesien.hxx"
#include <stdio.h>

void ComplexeCart::modifierCartesien(double x, double y)
{
  m_re=x;
  m_im=y;
}

void ComplexeCart::modifierPolaire(double mode, double argument)
{
  m_re=mode*cos(argument);
  m_im=mode*sin(argument);
}

void ComplexeCart::printCartesien() const
{
  if(im()>=0)
    {
      printf("%6.2f+%6.2fi",re(),im());
    }
  else
    {
      printf("%6.2f-%6.2fi",re(),-im());
    }
}

void ComplexeCart::printPolaire() const
{
  printf("%6.2fexp(i%6.2f)",mode(),arg());
}


ComplexeCart &ComplexeCart::operator=(const ComplexeCart &c)
{
  m_re=c.m_re;
  m_im=c.m_im;
  return *this;
}

ComplexeCart &ComplexeCart::operator+=(const ComplexeCart &c)
{
  m_re += c.m_re;
  m_im += c.m_im;
}  

ComplexeCart operator+(const ComplexeCart &c1, const ComplexeCart &c2)
{
  ComplexeCart result;
  result=c1;
  result+=c2;
  return result;
}


