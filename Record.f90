Subroutine Record(xa,ya,PT)
Use parameter_values
Implicit None

  Integer, dimension(m,m)::PT
  Integer::xa,xt,ya,yt,a      
          xt = xa
          yt = ya
         PT(xt,yt) = PT(xt,yt) + 1
End Subroutine Record
