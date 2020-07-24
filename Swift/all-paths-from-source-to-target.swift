/**
 * https://leetcode.com/problems/all-paths-from-source-to-target/
 * 
 * 
 */ 
// Date: Fri Jul 24 09:41:33 PDT 2020
class Solution {
    /// DFS to go from source to target 
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in graph
    ///     - Space: O(n), path to keep the temp path.
    ///
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        let n = graph.count - 1
        func dfs(_ current: Int, _ path: inout [Int], _ visited: inout Set<Int>) {
            if current == n {
                result.append(path + [current])
                return
            }
            visited.insert(current)
            path.append(current)
            for dst in graph[current] {
                dfs(dst, &path, &visited)
            }
            visited.remove(current)
            path.removeLast()
        }
        var path: [Int] = []
        var visited: Set<Int> = []
        dfs(0, &path, &visited)
        return result
    }
}
/**
 * https://leetcode.com/problems/all-paths-from-source-to-target/
 * 
 * 
 */ 
// Date: Fri Jul 24 09:44:37 PDT 2020
class Solution {
    /// Comparing with previous submission, remove `visited`
    /// Since, this is an acyclic graph, which means there is no cycle, and we don't need to keep track of where has been visited. 
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        let n = graph.count - 1
        func dfs(_ current: Int, _ path: inout [Int]) {
            if current == n {
                result.append(path + [current])
                return
            }
            path.append(current)
            for dst in graph[current] {
                dfs(dst, &path)
            }
            path.removeLast()
        }
        var path: [Int] = []
        dfs(0, &path)
        return result
    }
}
