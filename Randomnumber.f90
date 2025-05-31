
Subroutine RandomNumber(Rand_size,Rand1)
Implicit None           
Integer,Intent(in)::Rand_size
Double precision, dimension(Rand_size) :: Rand1 
Double precision ::random
INTEGER :: seed_size,ok,done,rand_counter  !Local variables 
INTEGER, DIMENSION(:):: seed  !Local variable
  
       call random_seed() ! initialize with system generated seed 
                       
         seed = 12345 
       call random_seed(put=seed)        ! set current seed
       call random_seed(get=seed)        ! get current seed
       !write(*,*) seed                  ! writes 12345
       
        Do rand_counter=1, Rand_size 
       call random_number(random)
      		Rand1(rand_counter)=random
           End Do
    End Subroutine RandomNumber


