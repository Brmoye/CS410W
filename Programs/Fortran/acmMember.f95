!
! Program takes in file input for acm members and adds them to a record that is searchable for
! dues owed greater than that amount
! Written by Brian Moye with re-use of some code given in class by Dr. Terwilliger
! CS 410W - Assignment #6
! January 30, 2022
!

program club_members
	implicit none
	
	type :: ACM_Member
		character(len=20) :: firstName, lastName
		character(len=25) :: email
		character(len=15) :: phone
		integer	 :: age
		real	 :: duesOwed
	end type ACM_Member
	
	type (ACM_Member) :: students(100)
	character(len=100) :: filename, err_msg
	integer :: fileLineNumber, fileStatus, studentNumber, i
	real :: amountOwed
	
	fileLineNumber = 0
	studentNumber = 1
	amountOwed = 0.0
	
	write (*,*) "Input file name:"
	read (*,*) filename
	
	! Some other options for status are "new" and "replace"
	open (unit=3, file=filename, status="old", action="read", iostat=fileStatus, iomsg=err_msg)
	
	openIf: if (fileStatus == 0) then
	    
		readLoop: do
			if (mod(fileLineNumber,6) == 0) then
                read(3,*,iostat=fileStatus) students(studentNumber)%firstName
            else if(mod(fileLineNumber,6) == 1) then
                read(3,*,iostat=fileStatus) students(studentNumber)%lastName
			else if(mod(fileLineNumber,6) == 2) then
                read(3,*,iostat=fileStatus) students(studentNumber)%email
			else if(mod(fileLineNumber,6) == 3) then
                read(3,"(A)",iostat=fileStatus) students(studentNumber)%phone
			else if(mod(fileLineNumber,6) == 4) then
                read(3,*,iostat=fileStatus) students(studentNumber)%age
			else 
                read(3,*,iostat=fileStatus) students(studentNumber)%duesOwed
            end if
            
			if (fileStatus /= 0) exit
			
			fileLineNumber = fileLineNumber + 1
			
			if(mod(fileLineNumber,6) == 0) then
				studentNumber = studentNumber + 1
			end if
			
		end do readLoop
		
		readIf: if (fileStatus > 0) then
			write (*,"(A)",advance="no") "An error occurred reading line "
			write (*,"(I4)") fileLineNumber
			stop
		else
			write (*,"(A20)") "End of file reached."
		end if readIf
		
	else openIf
		write (*,"(A)") "Error: " // trim(err_msg)
		stop
	end if openIf
	
	close(unit=3)
	
	write (*,*) "Please enter amount owed to search for:"
	read (*,*) amountOwed
	
	printStudents: do i = 1, studentNumber - 1
	
	    printIf: if(students(i)%duesOwed >= amountOwed) then
    		print 100
    		100 format(x, "First name:", 10x, "Last name:", 12x, "Email:", 20x, "Phone:", 13x, "Age:", 6x, "Amount owed:")
    		
    		print 200, students(i)%firstName, students(i)%lastName, students(i)%email, students(i)%phone, &
    		students(i)%age, students(i)%duesOwed
    		200 format(2x, a20, x, a20, 2x, a25, x, a15, 3x, i3, 4x, f7.2)
    	end if printIf
    	
	end do printStudents
	
end program club_members