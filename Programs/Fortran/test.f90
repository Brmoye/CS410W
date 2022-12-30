!
! Program takes in file input for exam scores and student names then calculates the average
! Written by Brian Moye with re-use of some code given in class by Dr. Terwilliger
! CS 410W - Assignment #5
! January 24, 2022
!

program examScores
	implicit none
	
	real, allocatable, dimension(:) :: scores
	character(len=50), allocatable, dimension(:) :: names
	character(len=50), allocatable, dimension(:) :: data
	integer :: numStudents, i, highStudent, lowStudent, fileLine, status, numLines, j
	real :: score, averageScore, highScore, lowScore
    character(len=40) :: filename, err_msg
	character(len=50) :: student
	
	fileLine = 1
	numLines = 0
	i = 1
	j = 1
	write (*,*) "Input file name:"
	read (*,*) filename
	
	! Some other options for status are "new" and "replace"
	open (unit=3, file=filename, status="old", action="read", iostat=status, iomsg=err_msg)
	
	openIf: if (status == 0) then
	
	    ! Find the number of lines in the file to declare array size
	    getNumLines: do
	        read(3,*,iostat=status)
	        if (status /= 0) exit
	        numLines = numLines + 1
	    end do getNumLines
	    
	    ! Go back to start of file and actually read in the data
	    rewind 3
	    
	    ! Since each record is student name, then score on next line divide numLines by 2 to get the number of students
	    numStudents = numLines / 2
	    
	    allocate(data(numLines))
	    allocate(scores(numStudents))
    	allocate(names(numStudents))
	    
		readLoop: do
		    if (mod(fileLine,2) == 1) then
                read(3,"(A)",iostat=status) names(i)
                i = i + 1
            else
                read(3,*,iostat=status) scores(j)
                j = j + 1
            end if
            
			if (status /= 0) exit
			
			fileLine = fileLine + 1
			
		end do readLoop
		
		readIf: if (status > 0) then
			write (*,"(A)",advance="no") "An error occurred reading line "
			write (*,"(I4)") fileLine
			stop
		else
			write (*,"(A20)") "End of file reached."
		end if readIf
		
	else openIf
		write (*,"(A)") "Error: " // trim(err_msg)
		stop
	end if openIf
	
	close(unit=3)

    highStudent = 1
	lowStudent = 1
	highScore = scores(1)
	lowScore = scores(1)
	
	do i = 1, numStudents
		averageScore = averageScore + scores(i)
		if (highScore < scores(i)) then
			highScore = scores(i)
			highStudent = i
		end if
		if (lowScore > scores(i)) then
			lowScore = scores(i)
			lowStudent = i
		end if
	end do
	
	averageScore = averageScore / numStudents
	
	print *
	
	write (*,"(A14)",ADVANCE='NO') "Average Score:"
	write (*,"(f7.2)") averageScore
	
	print *
	
	write (*,"(A11)") "High Score:"
	write (*,"(A50)") names(highStudent)
	write (*,"(f6.2)") scores(highStudent)
	
	print *
	
	write (*,"(A10)") "Low Score:"
	write (*,"(A50)") names(lowStudent)
	write (*,"(f6.2)") scores(lowStudent)
	
	print *
	
	print *, "Students who scored higher than the average:"
	
	do i = 1, numStudents
		if (scores(i) > averageScore) then
			write (*,"(A50)") names(i)
			write (*,"(f6.2)") scores(i)
		end IF
	end do
	
end program examScores