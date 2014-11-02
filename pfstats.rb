# Create a swiggity swooty programaroonie to calculate the number of
# ways (then, probability) that every dice sum can be rolled based
# on three variables: number of dice, number of sides, and value to
# be rolled.
# 
# The initial aim of this test will be to:
# 	 [x]	1. hardcode some values to test
#  	 [x]	2. generalize it to go from [n-1, x] (n dx dice)
#	 [x]	3. take values from the user and process them
#	 [x]	4. generalize to a maximum entered value, print all combinations that do that
#	 [x]	5. change the output to show only relevant standard dice
# 	 [ ]	6. build a simple GUI that takes input
#  	 [ ]	7. add a GUI that displays the data values
#  	 [ ]	8. optimize the calculation if possible
# 	 [ ]	9. figure out how to do some sort of graph thing
# 	 [ ]	10. generalize such that multiple dice are calculated/output
# 	 [ ]	11. finalize the presentation of that output
# 	 [ ]	12. show the averages for each one as well with formula n(x/2 + 1/2)
#
# PARAMS:
# 	n dx dice:
#  		n -> number of dice
# 		x -> sides on dice

# combination: calculate mathematical combinations of form (n choose k)
def nCr(n, k)
	( factorial(n) / ( factorial(k) * factorial(n - k) ) )
end

# factorial: calculate factorial (no built in function)
def factorial(num)
	(1..(num.zero? ? 1 : num)).inject(:*)
end

# sum_component: do one iteration of the sum
def sum_component(n, x, s, k)
	a = (-1)**k
	b = nCr(n, k)
	c = nCr( (s - x*k - 1), (n - 1) )
	return a * b * c
end

# print_sum: print one sum probability info
def print_sum(s)
	upper = ( (s - $n) / $x ).floor
	result = 0
	for k in 0..upper do
		result = result + sum_component($n, $x, s, k)
	end
	prob = (result.to_f * 100/ ($x ** $n)).round(2)
	puts "sum = #{s}: #{result} / #{$x.to_i**$n} = #{prob}%"
end

# print_results: print one full die probability (for all sums)
def print_results()
	puts "For #{$n} d#{$x.to_i} dice, we find:"
	for s in $n-1..$x*$n do
		print_sum(s)
	end
	print "\n"
end

def print_dice(total)
	j = 1
	for i in 1..(total / j) do
		$n = j
		$x = total/j
		if (total % j != 0)
			j += 1
			next
		end
		break if ($x == 1)
		j += 1
		if ($x == 4 || $x == 6 || $x == 8 || $x == 10 || $x == 12 || $x == 20)
			print_results()
		end
	end
end

print "Enter the max roll possible: "
total = gets.chomp().to_i
print_dice(total)
