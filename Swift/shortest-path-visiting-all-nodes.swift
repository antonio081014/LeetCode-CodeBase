class Solution {
    /// DFS
    /// - Complexity:
    ///     - Time: O(2^n * n * n), to visit all state, we need n * 2 ^ n, for each state, we need to visit n - 1 neighbors at most.
    ///     - Space: O(2^n * n), as ref as cache.
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        let n = graph.count
        
        var cache = Array(repeating: Array(repeating: -1, count: 1 << n), count: n)
        
        func dfs(_ node: Int, _ mask: Int) -> Int {
            if cache[node][mask] >= 0 { return cache[node][mask] }
            if (mask & (mask - 1)) == 0 { 
                cache[node][mask] = 0
                return 0
            }
            cache[node][mask] = Int.max / 2
            
            for neighbor in graph[node] {
                if (mask & (1 << neighbor)) != 0 {
                    let tmp = 1 + min(dfs(neighbor, mask), dfs(neighbor, mask ^ (1 << node)))
                    cache[node][mask] = min(cache[node][mask], tmp)
                }
                
            }
            
            return cache[node][mask]
        }
        
        var result = Int.max
        for node in 0 ..< n {
            result = min(result, dfs(node, (1 << n) - 1))
        }
        return result
    }
}
