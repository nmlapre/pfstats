# Create a swiggity swooty programaroonie to calculate the number of
# ways (then, probability) that every dice sum can be rolled based
# on three variables: number of dice, number of sides, and value to
# be rolled.
# 
# The initial aim of this test will be to:
# 	 [x]	1. hardcode some values to test
#  	 [x]	2. generalize it to go from [n-1, x] (n dx dice)
#    [x]	3. take values from the user and process them
# 	 [ ]	4. build a simple GUI that takes input
#  	 [ ]	5. add a GUI that displays the data values
#  	 [ ]	6. optimize the calculation if possible
# 	 [ ]	7. figure out how to do some sort of graph thing
# 	 [ ]	8. generalize such that multiple dice are calculated/output
# 	 [ ]	9. finalize the presentation of that output
# 	 [ ]	10. show the averages for each one as well with formula n(x/2 + 1/2)
#
# PARAMS:
# 	n dx dice:
#  		n -> number of dice
# 		x -> sides on dice

# combination: calculate mathematical combinations of form (n choose k)
def nCr(n, k)
	return ( factorial(n) / ( factorial(k) * factorial(n - k) ) )
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

def print_results(s)
	upper = ( (s - $n) / $x ).floor
	result = 0
	for k in 0..upper do
		result = result + sum_component($n, $x, s, k)
	end
	prob = (result.to_f * 100/ ($x ** $n)).round(2)
	puts "sum = #{s}: #{result} / #{$x**$n} = #{prob}%"
end

print "Enter how many dice you want to roll: "
$n = gets.chomp().to_i			# n
print "Enter how many sides they have: "
$x = gets.chomp().to_i			# x-sided dice

puts "For #{$n} d#{$x} dice, we find:"
for s in $n-1..$x*$n do
	print_results(s)
end
