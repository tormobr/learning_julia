# Hello world program
print("Hello world\n")

# Simple arrays
a = ["hello", "this", "is", "a", "test"]


for x in a
    print(x, "\n")
end

for (i, x) in enumerate(a)
    print(i, " ",  x, "\n")
end

# 2D arrays??
a = [[1,2,3], [4,5,6],[7,8,9]]

for row in a
    for col in row
        print(col, "\n")
    end
end


for row in a
    print(row, "\n")
end
