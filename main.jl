# Hello world program
println("Hello world")

# Simple arrays
a = ["hello", "this", "is", "a", "test"]


for x in a
    println(x)
end

for (i, x) in enumerate(a)
    println(i, " ",  x)
end

# 2D arrays??
a = [[1,2,3], [4,5,6],[7,8,9]]

for row in a
    for col in row
        println(col)
    end
end


for row in a
    println(row)
end

# Sum of list
for row in a
    println(sum(row))
end

# List comprehensions 
a = [i for i=0:10]
println(a)
println(sum(i for i=0:10))
println("reverse sort ", sort(a, rev=true))

# Some string stuff here..
s = "hello this is a test"
ss = split(s)
ss2 = split(s, "e")
println(ss)
println(ss2)

s = "1,2,3,4,5,6"
sum_of_string = sum([parse(Int64, c) for c in split(s, ",")])
println(sum_of_string)

