!
! 
!
!

program readFile
	implicit none
	
	character(len=20) :: filename
	integer :: numValues
	integer :: status
	real 	:: value
	
	numValues = 0
	write (*,*) "Input file name:"
	read (*,*) filename
	write (*,*) "The input file name is ", filename
	
	! Some other options for status are "new" and "replace"
	open (unit=3, file=filename, status="old", action="read", iostat=status)
	
	openIf: if (status == 0) then
		readLoop: do
			read(3,*,iostat=status) value
			if (status /= 0) exit
			numValues = numValues + 1
			write (*,*) numValues, value
		end do readLoop
		
		readIf: if (status > 0) then
			write (*,*) "An error occurred reading line ", numValues + 1
		else
			write (*,"(A34)",advance="no") "End of file reached. Values read: "
			write (*,"(f9.4)") numValues
		end if readIf
		
	else openIf
		write (*,*) "Error opening file. IOSTAT=", status
		
	end if openIf
	
	close(unit=3)
	
end program readFile