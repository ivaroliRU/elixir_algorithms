#Author: Ívar Óli Sigurðsson
#Simple list operations like merge sort and splitting

#List operations
defmodule ListOperations do
    #splitting a list into two list alternating
    def halve(a) do
        case a do
            [] -> {[],[]}
            [x] -> {[x],[]}
            [x,y] -> {[x],[y]}
            [x,y|rest] -> 
                {c,d} = halve(rest)
                {[x]++c,[y]++d}
        end
    end

    #split list into two lists at n-th place
    def split([h|tail], n) do
        if n >= length([h|tail]) do
            {[h|tail], []}
        else
            case n do
                0 -> {[], [h|tail]}
                x when x > 0 -> 
                    {a, b} = split(tail, n-1)
                    {[h]++a,b}
            end
        end
    end

    #merge two sorted arrays
    def merge([h1|t1], [h2|t2]) do
        if h1 < h2 do
            [h1] ++ merge(t1, [h2|t2])
        else
            [h2] ++ merge([h1|t1], t2)
        end
    end
    def merge([h1|t1], []) do
        [h1|t1]
    end
    def merge([], [h2|t2]) do
        [h2|t2]
    end
    def merge([],[]) do
        []
    end

    #perform merge sort
    def sort(arr) do
        case arr do
        [] -> []
        [x] -> [x]
        [h|t] ->
            #find splitting point
            point = length(arr) |> div(2)
            {left, right} = arr |> split(point)
            #recursively sort and merge the split arrays
            merge(sort(left), sort(right))
        end
    end
end