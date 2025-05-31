!2D MMC simulation of BFA chain adsorption on a flat surface
integer, parameter :: nmono = 20, relax = 10000*nmono, mcstep = 1000000*nmono
integer, parameter :: lb = 200, dmin = 1, lmax = 3*nmono, samp = mcstep/10000
integer, dimension(-lb-1:lb+1, -1:lb+1) :: tag
integer, dimension(nmono) :: x, y
double precision, parameter :: epsi = -2d0
integer, dimension(4) :: jx, jy
double precision :: e_new, e_old, delta_e, nad, ave_nad
integer :: i, j, k, dr, dl, s, xt, yt, ix, iy, ymin 

call generate_seed(k)
i = ran(k)

!Initialize jump vectors
jx(1) = 1; jy(1) = 0
jx(2) = 0; jy(2) = -1
jx(3) = -1; jy(3) = 0
jx(4) = 0; jy(4) = 1

tag = 0
x(1) = -nmono + 1
y(1) = 0
tag(x(1),y(1)) = 1

!Place the chain in the middle of the box
do i = 2, nmono
x(i) = x(i-1) + 2
y(i) = 0
tag(x(i), y(i)) = 1
enddo

!Start chain relaxation
do j = 1, relax
!Select a monomer at random
k = ran()*nmono + 1
!Select a direction at random
i = ran()*4 + 1
xt = x(k) + jx(i)
yt = y(k) + jy(i)

!Boundary conditions - reflective
if (xt.gt.lb) xt = lb
if (xt.lt.-lb) xt = -lb
if (yt.gt.lb) yt = lb
if (yt.lt.0) yt = 0
!Test of volume exclusion: no monomer within a distance less than 2
s = 0
do ix = -1, 1
do iy = -1, 1
s = s + tag(xt+ix,yt+iy)
enddo
enddo
if (s.gt.1) cycle

!Bond length test
!Left bond
if (k.gt.1) then
dl = (xt - x(k-1))**2 + (yt - y(k-1))**2
if(dl.lt.4.or.dl.gt.13) cycle
endif
!Right bond
if (k.lt.nmono) then
dr = (xt - x(k+1))**2 + (yt - y(k+1))**2
if(dr.lt.4.or.dr.gt.13) cycle
endif

!Accept the new move
tag(x(k),y(k)) = 0
x(k) = xt
y(k) = yt
tag(x(k),y(k)) = 1
!print*,j, k, x(k), y(k)
enddo   ! Relaxation loop

!Bring the chain near the adsorbing surface
ymin = y(1)
do i = 2, nmono
if(y(i).lt.ymin)  ymin = y(i)
enddo
do i = 1, nmono
y(i) = y(i) - (ymin-dmin)
enddo

ave_nad = 0d0
do i = 1, nmono
!print*, x(i), y(i)
enddo

!Start chain adsorption
do j = 1, mcstep

!Count the number of adsorbed monomers
if (mod(j,samp).eq.0) then
nad = 0
do i = 1, nmono
if (y(i).eq.0) nad = nad + 1
enddo
ave_nad = ave_nad + nad
endif

!Select a monomer at random
k = ran()*nmono + 1
!Select a direction at random
i = ran()*4 + 1
xt = x(k) + jx(i)
yt = y(k) + jy(i)

!Boundary conditions - reflective
if (xt.gt.lb) xt = lb
if (xt.lt.-lb) xt = -lb
if (yt.gt.lmax) yt = lmax
if (yt.lt.0) yt = 0
!Test of volume exclusion: no monomer within a distance less than 2
s = 0
do ix = -1, 1
do iy = -1, 1
s = s + tag(xt+ix,yt+iy)
enddo
enddo
if (s.gt.1) cycle

!Bond length test
!Left bond
if (k.gt.1) then
dl = (xt - x(k-1))**2 + (yt - y(k-1))**2
if(dl.lt.4.or.dl.gt.13) cycle
endif
!Right bond
if (k.lt.nmono) then
dr = (xt - x(k+1))**2 + (yt - y(k+1))**2
if(dr.lt.4.or.dr.gt.13) cycle
endif

e_new = 0; e_old = 0
if(yt.eq.0) e_new = epsi
if(y(k).eq.0) e_old = epsi
delta_e = e_new - e_old
if (delta_e.le.0d0) then
!Accept the new move
tag(x(k),y(k)) = 0
x(k) = xt
y(k) = yt
tag(x(k),y(k)) = 1
else
if(ran().lt.exp(-delta_e)) then
!Accept the new move
tag(x(k), y(k)) = 0
x(k) = xt
y(k) = yt
tag(x(k),y(k)) = 1
endif
endif
enddo   ! Adsorption loop

ave_nad = ave_nad/(mcstep/samp)
print*,ave_nad

open (10, file='file.dat', status='unknown')
do i = 1, nmono
write(10,*) x(i), y(i)
enddo
end
