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
        qid = Enum.at(ids, q)
        changed_ids = change_ids(ids, pid, qid)
        {vertices, changed_ids}
    end
    #privatly iterate over list and change ids
    defp change_ids(ids, pid, qid) do
        case ids do
            [h|t] ->
                if h === pid do
                    [qid] ++ change_ids(t, pid, qid)
                else
                    [h] ++ change_ids(t, pid, qid)
                end
            [h] ->
                if h === pid do
                    [qid]
                else
                    [h]
                end
            [] -> []
        end
    end
end

#g = UnionFind.graph(5)
#g = UnionFind.unite(g,1,2)