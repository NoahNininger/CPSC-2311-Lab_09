/* Noah Nininger
   CPSC 2311 Widman
   06/18/2023 (given the 6/18 extension)
   Lab 09
*/

1.(10 pts) In the function main on line 33, a mov instruction copies the stack pointer address into r0.
	a.What is that the address of? (Hint: Look at the C code)
		It is the address of the stack pointer
	b.What is it used for afterwards in init and main?
		In init, it is used to store the values of x_arg and y_arg in the local struct. 
		In main, it is passed as the argument to access dot structure members.
2.(10 pts) Which two lines in the C program (put the full line of code, not line numbers) correspond to the following two lines of function init in the assembly version?
	str r1, [sp]
	str r2, [sp, #4]
	----------------
	local.x = x_arg;
	local.y = y_arg;
3.(10 pts) In the function zero, what value(s) does the program store at addresses [sp] and [sp, #4] (Lines 19 and 20)?
	stores the value 0 at the addresses
4.(10 pts) Which two lines in the C program (put the full line of code, not line numbers) correspond to the following two lines of function zero in the assembly version?
	str r3, [sp]
	str r3, [sp, #4]
	----------------
	local.x = 0;
	local.y = 0;
5.(10 pts) Based on the ARM code (not the C code), in the function zero, what does it return? Remember, there is no specific return <variable> command in ARM. The return value is always whatever is stored in the register designated to hold the return value (you should know which one this is). Don't answer the question with the register name, actually describe what the value is and what it represents.
	it returns 0 and represents the local struct with both members set to 0

