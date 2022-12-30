#!/usr/bin/perl

$a = 2.8;
$b = 345.2891;
$c = 2/9;
$d = "George";

printf("a = %d\n", $a);

printf("$a $b");
printf("\n");
printf('$a $b');
printf("\n\n");

printf("a = %d\n", $a);
printf("b = %d\n", $b);
printf("c = %d\n", $c);
printf("d = %s\n\n", $d);


printf("a = %8.3f\n", $a);
printf("b = %8.3f\n", $b);
printf("c = %8.3f\n", $c);
printf("d = %s\n\n", $d);

printf("a=%5.2f b=%5.2f c=%5.2f\n\n", $a, $b, $c);