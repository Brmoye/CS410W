#
# Brian Moye Assignment 7 for CS410W
# Program is a tax calculator for Alabama state tax.
#
#
print "Welcome to the Alabama, Single Residents \$6000 or more income tax calculator!\n";

do
{
	print "Please enter your first name: ";
	$firstName = <STDIN>;
	chomp($firstName);

	print "Please enter your last name: ";
	$lastName = <STDIN>;
	chomp($lastName);

	$deductions = 1500;
	print "Deductions start at \$1500.\n";

	print "Please input how much Alabama state tax was withheld, using only whole numbers: ";
	$taxWithheld = <STDIN>;
	chomp($taxWithheld);

	print "Please input your total income, as a whole number: ";
	$totalIncome = <STDIN>;
	chomp($totalIncome);

	$taxableIncome = $totalIncome - $deductions;
	print "Your taxable income is \$$taxableIncome.\n";

	$incomeTaxDue = 110 + $taxableIncome*0.05;
	print "Your income tax due is \$$incomeTaxDue.\n";

	$refund = $taxWithheld - $incomeTaxDue;

	if($refund < 0)
	{
		print "You still owe \$$refund.\n";
	}
	else
	{
		print "Your refund is \$$refund.\n";
	}

	print "Thank you $firstName $lastName, for using our tax calculator!\n";
	print "Would you like to calculate the taxes for another customer? (Y/N)? ";
	$reply = <STDIN>;
	chomp($reply);
} while ($reply eq "Y" or $reply eq "y");