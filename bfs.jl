
function BFS(start_i, start_j, arr, limits)
    dirs = [(1,0), (-1,0), (0,1),(0,-1)]
    visited = Set()
    q = []
    push!(q, (start_i, start_j))  # init queue to start pos
    count = 0

    # while something in queue
    while ! isempty(q)
        current = popfirst!(q)
        c_i, c_j = current[1], current[2]
        # if we have visited this before
        if arr[c_i, c_j] != 1 || current in visited
            continue
        end

        #visited.add(current)
        push!(visited, (current))
        count += 1

        # Loop over neighbours and add to queue
        for (di, dj) in dirs
            push!(q, (c_i + di, c_j + dj))
        end
    end

    return count
end

max_x = 1000
max_y = 1000
shift = 2
border_length = 800
arr = ones(Int32, max_y, max_x)

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

@time ret = BFS(shift+5,shift+5, arr, limits)
println(ret)
