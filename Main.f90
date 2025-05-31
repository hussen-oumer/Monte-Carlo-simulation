Module parameter_values
  Implicit None
  save 
Integer,parameter :: N_part  = 10        ! No.s of particle 
Integer,parameter :: N_steps =  100000   ! No.s of Steps
Integer,parameter :: Nstate  = 1         ! No.s of configuration 
Integer,parameter :: N_site  =  50       ! length from the Origin
Integer           ::  m 

End module parameter_values

Program Particle_in_2D_potential
 Use Parameter_values
Implicit None
 Double precision,dimension(:)   :: apx
 Double precision,dimension(:,:) :: Vext        ! external potential
 Double precision,dimension(:)   :: Rand1        ! Random number
 Integer,dimension (:)           :: X1,Y1       ! x and Y position
 Integer,dimension (:,:)         :: PT          ! Histogram Tally  
 Logical,dimension  (:,:)        :: Pos         ! Position vector
 Integer:: x,y,xt,yt,xa,ya,istep,istate,xm,ym,Rand_size,ipart ! local Variable
          m= 2*N_site +1
          Rand_size = N_steps + 1000
          
     Call Array(X1,Y1,Pos)
     Call Potential(Vext)
     Call Initial(PT)
     Call Move(X1,Y1,xa,ya,xm,ym,Pos,Vext,apx,Rand_size)
     
     Do x = -N_site,N_site
       xt =x
     Open(Unit = 20,File = '2Dmcarlo.txt')     
     Write(20,*) x,apx(xt)
     Print*,x,apx(xt) 
     End do
End program Particle_in_2D_potential

