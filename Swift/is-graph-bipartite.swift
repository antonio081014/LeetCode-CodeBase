/**
 * https://leetcode.com/problems/is-graph-bipartite/
 * 
 * 
 */ 
// Date: Wed Mar 10 10:31:09 PST 2021
class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let n = graph.count
        var color = Array(repeating: 0, count: n)
        
        func dfs(_ start: Int) -> Bool {
            let nextColor = 3 - color[start]
            for next in graph[start] {
                if color[next] == color[start] {
                    return false
                }
                if color[next] == 0 {
                    color[next] = nextColor
                    if dfs(next) == false { return false }
                }
            }
            return true
        }
        
        for start in 0 ..< n {
            if color[start] == 0 {
                color[start] = 1
                if dfs(start) == false {
                    return false
                }
            }
        }
        return true
    }
}/**
 * https://leetcode.com/problems/is-graph-bipartite/
 * 
 * 
 */ 
// Date: Wed Mar 10 10:36:12 PST 2021
class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let n = graph.count
        var color = Array(repeating: 0, count: n)
        for start in 0 ..< n {
            if color[start] == 0 {
                color[start] = 1
                var queue = [start]
                while queue.isEmpty == false {
                    var size = queue.count
                    while size > 0 {
                        size -= 1
                        let node = queue.removeFirst()
                        let c = color[node]
                        for next in graph[node] {
                            if color[next] == 0 {
                                color[next] = 3 - c
                                queue.append(next)
                            } else if color[next] == c {
                                return false
                            }
                        }
                    }
                }
            }
        }
        return true
    }
}