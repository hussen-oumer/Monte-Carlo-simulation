Subroutine snapshot(PT,apx)
Use Parameter_values
    Implicit none
Integer, dimension(m,m)::PT
Double precision, dimension(m,m)::ap 
Double precision, dimension(m)::apx   
Integer::x,xt,y,yt,f,ta,totala
Double precision::totalx,tx
Double precision::nd,norm
  
        totala=0    
   
       Do x = -N_site,N_site
       Do y = -N_site,N_site
      		xt = x
      		yt = y
      		ta = PT(xt,yt)
      		totala = totala+ta
        End do
        End Do

       Do x = -N_site,N_site
       Do y = -N_site,N_site
         xt = x
         yt = y
         f = PT(xt,yt)  
         nd = f
       norm = totala
     ap(xt,yt) = nd/norm
      End do
      End Do

       Do x = -N_site,N_site
        totalx = 0
       Do y = -N_site,N_site
      		xt = x
      		yt = y
      		tx = ap(xt,yt)
      		totalx = totalx+tx
        End do
       apx(xt) = totalx
        End Do

   end Subroutine snapshot

