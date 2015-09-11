#ifndef __COMPLEXEPOLAIRE_HXX__
#define __COMPLEXEPOLAIRE_HXX__

#include <math.h>

class ComplexePol{
public:

  ComplexePol() : m_mode(0), m_arg(0){
  };
  
  double mode() const{
    return m_mode;
  }
  
  double arg() const{
    return m_arg;
  }

  double re() const{
    return m_mode*cos(m_arg);
  }

  double im() const{
    return m_mode*sin(m_arg);
  }

  void modifierCartesien(double x, double y);
  void modifierPolaire(double mode, double argument);

  void printCartesien() const;
  void printPolaire() const;

private:
  double m_mode;
  double m_arg;

};

#endif //__COMPLEXECARTESIEN_HXX__
