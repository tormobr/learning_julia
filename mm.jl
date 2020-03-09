
function mm(a, b, n)
    ret = zeros(n,n)
    for i = 1:n
        for j = 1:n
            for k = 1:n
                ret[i,j] += a[i, k] * b[k, j]
            end
        end
    end
end

function mm2(a, b, n)
    ret = zeros(n,n)
    #b = transpose(a, n)
    for i = 1:n
        for j = 1:n
            for k = 1:n
                ret[i,j] += a[i, k] * b[j, k]
            end
        end
    end
end

function transpose(a, n)
    ret = zeros(n, n)
    for i = 1:n
        for j = 1:n
            ret[j, i] = a[i , j]
        end
    end
    return ret
end

n = 800
a = rand(n, n)

@time mm(a, a, n)
@time mm2(a, a, n)
