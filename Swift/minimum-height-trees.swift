/**
 * https://leetcode.com/problems/minimum-height-trees/
 * 
 * 
 */ 
// Date: Tue Jun  9 10:01:29 PDT 2020
class Solution {
    /// TLE
    /// - Complexity:
    ///     - Time: O(n*n*e), n is the number of nodes and e is number of edges. So, possibly O(n^4).
    ///     - Space: O(e)
    ///
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        var roots: [Int] = []
        var minHeight = n
        for root in 0 ..< n {
            var queue = [root]
            var height = 0
            var visited: Set<Int> = [root]
            while queue.isEmpty == false {
                var n = queue.count
                height += 1
                while n > 0 {
                    n -= 1
                    let node = queue.removeFirst()
                    for dst in graph[node] {
                        if visited.contains(dst) == false {
                            queue.append(dst)
                            visited.insert(dst)
                        }
                    }
                }
            }
            
            // print("Root: \(root) - \(height)")
            if height < minHeight {
                roots = [root]
                minHeight = height
            } else if height == minHeight {
                roots.append(root)
                minHeight = height
            }
        }
        return roots
    }
}
/**
 * https://leetcode.com/problems/minimum-height-trees/
 * 
 * 
 */ 
// Date: Wed Nov  4 10:16:50 PST 2020
class Solution {
    /// TLE solution, O(n^2 + n * E)
    /// - Complexity:
    ///     - Time: O(n * (V + E)), v = n, e = edges.count.
    ///     - Space:
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        var roots: [Int] = []
        var minHeight = n
        for root in 0 ..< n {
            var queue: [Int] = [root]
            var visited: Set<Int> = [root]
            var height = 0
            while queue.isEmpty == false {
                var layerCount = queue.count
                height += 1
                while layerCount > 0 {
                    layerCount -= 1
                    let node = queue.removeFirst()
                    for neighbor in graph[node] {
                        if visited.contains(neighbor) == false {
                            visited.insert(neighbor)
                            queue.append(neighbor)
                        }
                    }
                }
            }
            if height < minHeight {
                minHeight = height
                roots = [root]
            } else if height == minHeight {
                roots.append(root)
            }
        }
        return roots
    }
}/**
 * https://leetcode.com/problems/minimum-height-trees/
 * 
 * 
 */ 
// Date: Wed Nov  4 10:19:41 PST 2020
class Solution {
    /// Toplogical solution.
    /// - Complexity:
    ///     - Time: O(V + E), V = n, e = edges.count
    ///     - Space:
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph: [Set<Int>] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].insert(edge[1])
            graph[edge[1]].insert(edge[0])
        }

        var leaves: Set<Int> = []
        for leaf in 0 ..< n {
            if graph[leaf].count <= 1 {
                leaves.insert(leaf)
            }
        }
        var nextLayer: Set<Int> = []
        repeat {
            nextLayer = []
            for leaf in leaves {
                for neighbor in graph[leaf] {
                    graph[neighbor].remove(leaf)
                    if graph[neighbor].count == 1 {
                        nextLayer.insert(neighbor)
                    }
                }
            }
            if nextLayer.isEmpty == false {
                leaves = nextLayer
            }
        } while !nextLayer.isEmpty
        return Array(leaves)
    }
}