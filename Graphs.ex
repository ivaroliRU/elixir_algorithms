defmodule UnionFind do
    # define graph (as a touple of vertices and ids)
    def graph(n) do
        graph(n,0)
    end
    defp graph(n, i) do
        if i < n do
            {vertices, ids} = graph(n, i+1)
            {[i]++vertices,[i]++ids}
        else
            {[], []}
        end
    end

    #simple find
    def find({vertices, ids},p, q) do
        Enum.at(ids, p) === Enum.at(ids, p)
    end

    def unite({vertices, ids},p, q) do
        pid = Enum.at(ids, p)
    end
end