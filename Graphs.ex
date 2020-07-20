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
        Enum.at(ids, p) === Enum.at(ids, q)
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
#g = UnionFind.unite(g,2,3)
#UnionFind.find(g,1,3)

defmodule DFS do
    #define graph as a list of adj lists, numbering from 0 to n-1
    def graph(n) do
        Enum.map(1..n, fn x -> [] end)
    end

    #add edge between 2 vertices
    def add_edge(graph, v,w) do
        new_adj = Enum.at(graph, v) ++ [w]
        List.replace_at(graph, v, new_adj)
    end

    #perform dfs traversal
    def dfs(graph, v) do
        #visited nodes
        visited = Enum.map(1..length(graph), fn x -> false end)
        dfs(graph, v, visited)
    end
    defp dfs(graph, v,visited) do
        #set the current node to visited
        visited = List.replace_at(visited, v, true)
        next = Enum.at(graph, v)
        IO.puts "Visited node #{v}"

        for w <- next do
            if Enum.at(visited, w) == false do
                dfs(graph, w, visited)
            end
        end
    end
end

#g = DFS.graph(4)
#g = DFS.add_edge(g, 0, 1)
#g = DFS.add_edge(g, 0, 2) 
#g = DFS.add_edge(g, 1, 2) 
#g = DFS.add_edge(g, 2, 0) 
#g = DFS.add_edge(g, 2, 3) 
#g = DFS.add_edge(g, 3, 3) 
#DFS.dfs(g, 0)