Subroutine  Potential(Vext)
use parameter_values
Implicit None

Double precision,dimension(m,m) :: Vext
Double precision                :: xr,yr,Ulocal,x_max,Y_max,U_max  
Integer::x,y,xt,yt
    
       U_max = 1
       X_max = N_site
       Y_Max = N_site

    DO x = -N_site,N_site
    Do y = -N_site,N_site
         
            xr = x
            yr = y
            Ulocal = U_max*((xr/x_max)**2)    
            xt = x
            yt = y
            Vext(xt,yt) = Ulocal
     End do
     End do 
End Subroutine potential
