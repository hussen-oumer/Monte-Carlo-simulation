Subroutine Move(X1,Y1,xa,ya,xm,ym,Pos,Vext,apx,Rand_size)
 Use parameter_values
 Implicit None
 Integer,dimension(N_part)       :: X1,Y1 
 logical,dimension(m)           :: Pos
 Double precision,dimension(m)  :: Vext,ap
 Double precision,dimension(m,m):: apx
 Double precision,dimension(Rand_size) :: Rand1
 Integer,dimension(m,m) :: PT
 Integer :: x,xt,y,yt,xa,ya,istep,istate,xm,ym,Rand_size,ip  
 
  Call Random_Number(Rand_size,Rand1)
    Do istate = 1,Nstate
    Do istep =  1,N_step
    Do ip = 1,Npart
        xa =X1(ip)
    	ya =Y1(ip)
    	Xt = xa
    	Yt = ya
    If (.Not.Pos(xt,yt)) then
    write(*,*) "No Particle to move"
    Stop
    End if

    	Pos(xt,yt) = 0
    	! Start Move 
    If (Rand1(istep) < 0.25)then
       xm = xa + 1  ; ym = ya 
    Elseif(0.25 <= Rand1(istep).and.Rand1(istep) < 0.5)then 
      xm = xa - 1   ;  ym = ya 
    Elseif(0.5 <= Rand1(istep).and.Rand1(istep) < 0.75)then
      xm = xa       ; ym = ya + 1
     Else
      xm = xa ; ym = ya -1
    End If
          ! Apply Periodic Boundary Condition
    If (xm >  N_site)xm =  N_site 
    If (xm < -N_site)xm = -N_site
    If (ym >  N_site)ym =  N_site
    If (ym < -N_site)ym = -N_site

           xt = xm
           yt = ym

     If(.Not.Pos(xt,yt))then

   call Probability(ip,X1,Y1,xa,xm,ya,ym,vext,Lattice)
         Else
      xt = xa 
      yt = ya
      Pos(xt,yt) = .True.
    cycle
     End If

  
End Subroutine Move
