#ifndef __COMPLEXECARTESIEN_HXX__
#define __COMPLEXECARTESIEN_HXX__

#include <math.h>

class ComplexeCart{
public:

  ComplexeCart() : m_re(0), m_im(0){
  };
  
  double re() const{
    return m_re;
  }

  double im() const{
    return m_im;
  }

  double mode() const{
    return sqrt(m_re*m_re+m_im*m_im);
  }

  double arg() const{
    return atan2(m_re,m_im);
  }

  ComplexeCart &operator+=(const ComplexeCart &);
  ComplexeCart &operator=(const ComplexeCart &);
  friend ComplexeCart operator+(const ComplexeCart &, const ComplexeCart &);

  void modifierCartesien(double x, double y);
  void modifierPolaire(double mode, double argument);

  void printCartesien() const;
  void printPolaire() const;

private:
  double m_re;
  double m_im;

};

#endif //__COMPLEXECARTESIEN_HXX__
