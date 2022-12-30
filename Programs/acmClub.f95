!
!
!
!

program student_club
	implicit none
	
	type :: ACM_Member
		character(len=20) :: firstName, lastName
		character(len=30) :: email
		character(len=15) :: phone
		integer	 :: age
		real	 :: duesOwed
	end type ACM_Member
	
	! To declare 100 of type student at once do: "type (ACM_Member) :: student(100)"
	type (ACM_Member) :: student ! Declare a variable of type ACM_Member
	
	! Initialize a variable
	student = ACM_Member("John", "Doe", "jdoe@una.edu", "(256)765-1111", 23, 15.00)
	
	write (*,*) "Student name is ", trim(student%firstName)," ", trim(student%lastName)
	
end program student_club