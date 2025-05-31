Subroutine Probability(ip,X1,Y1,xa,xm,ya,ym,Vext,Pos)
Use parameter_values
Implicit None
  Integer::xm,xa,ya,ym,ip
  Integer, dimension(N_part)::X1,Y1 
  Double precision,dimension(m,m)::Vext 
  Logical ,dimension(m,m)::Pos  
  Double precision::vi,vf,delV,kB,rnd,T,pro,Beta         
  Integer::xti,xtf,yti,ytf,dx,xt,yt 

  kB = 0.8625e-4  !1.38e-23      !Boltzmann constant 
   T = 300

  Beta = kB*T
   xti = xa                   
   xtf = xm 
   yti = ya                   
   ytf = ym 
    vi = Vext(xti,yti)
    Vf = Vext(xtf,ytf)
    
      delV = Vf - Vi

    If (delV <= 0)then      
       Xa = Xm ; ya = ym   
    Elseif(delV > 0)then 
    Pro = Exp(-delv/(Beta))

   call random_number(rnd) 
   If(pro >= rnd)then  
        Xa = Xm; ya = ym  
    Else 
        Xa = Xa ; ya = ya
    
     End If
   End If
          xt = xa
          yt = ya
  Pos(xt,yt) = .True.
  	X1(ip) = xa  
   	Y1(ip) = ya
End Subroutine probability
