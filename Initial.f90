Subroutine Initial(PT)
Use parameter_values
Implicit None

Integer,dimension(m,m) :: PT
Integer :: x,y,xt,yt
   
   DO x = -N_site, N_site
   Do y = -N_site, N_site

     xt = x
     yt = y
     PT(xt,yt) = 0
    End do
    End do
End Subroutine Initial
