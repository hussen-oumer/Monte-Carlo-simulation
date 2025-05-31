 Subroutine Array(X,Y,Pos)
 Use Parameter_values
 Implicit None 
 Integer,Intent(Out),dimension(N_part) :: X,Y
 Integer, Intent(Out),dimension(m,m) :: Pos
 Integer,Dimension(:)                :: seed
 Double precision,dimension(2)       :: Ran
 Integer :: i,l,ux,uy,xt,yt,xi,yi,i_seed
 
  Call RANDOM_SEED(get = seed)
  DO ux = -N_site,N_site
  Do Uy = -N_site,N_site
  
      xt = ux
      yt = uy
      Pos(xt,yt) = .false.       ! Forming array of Sites in 2D 
   End do
   End do
          seed =13
          Call RANDOM_SEED(Put = seed)
   Do i = N_part
   Do 
      Call Random_number(ran(1))
      x(i) = 2* N_site*ran(1)-N_site 
      call Random_number(ran(2))
      y(i) = 2* N_site*ran(1)-N_site  
       
         xt = x(i)
         yt = y(i)
       If(Pos(xt,yt)) Then
        cycle
        Else
        Pos(xt,yt) = .True.
        Endif
        Exit
     End do
     End do
     
  
 End Subroutine Array
