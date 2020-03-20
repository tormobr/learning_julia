using DataStructures
function BFS(start, arr, limits)
    dirs = [(1,0), (-1,0), (0,1),(0,-1)]
    visited = Set{Tuple{Int64, Int64}}()
    q = Array{Tuple{Int64, Int64}}([])
    push!(q, start)
    count = 0

    while ! isempty(q)
        current = popfirst!(q)
        c_i, c_j = current
        if arr[c_i, c_j] != 1 || current in visited
            continue
        end

        push!(visited, (current))
        count += 1

        for (di, dj) in dirs
            push!(q, (c_i + di, c_j + dj))
        end
    end

    return count
end



"""
function DFS(i, j, arr, limits, visited, depth)
    dirs = [(1,0), (-1,0), (0,1),(0,-1)]
    if (i, j) in visited || arr[i, j] != 1
        return 0
    end

    push!(visited, (i, j))
    count = 0
    for (di, dj) in dirs
        count += DFS(i+di, j+dj, arr, limits, visited, depth+1)
    end

    return count + 1
        
end
"""

max_x = 10000
max_y = 10000
shift = 2
border_length = 1000
arr = ones(Int8, max_y, max_x)

i1 = [shift for i=1:border_length]
j1 = [i for i=shift:shift+border_length]

i4 = [i for i=shift:shift+border_length]
j4 = [shift+border_length-1 for i=1:border_length]

j2 = [shift for i=1:border_length]
i2 = [i for i=shift:shift+border_length]

j3 = [i for i=shift:shift+border_length-2]
i3 = [shift+border_length-1 for i=1:border_length]
arr[shift+border_length-2, shift+border_length-1] = 0

limits = vcat(Set(zip(j1, i1)), Set(zip(j2, i2)), Set(zip(j3,i3)), Set(zip(j4,i4)))

for s in limits
    for (i, j) in s
        arr[i, j] = 2
    end
end

@time ret = BFS((shift+5,shift+5), arr, limits)
println(ret)
#visited = Set()
#@time ret = DFS(shift+5,shift+5, arr, limits)
#println(ret)
