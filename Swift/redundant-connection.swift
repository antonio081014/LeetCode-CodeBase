/**
 * https://leetcode.com/problems/redundant-connection/
 * 
 * 
 */ 
// Date: Fri Jun 25 16:16:27 PDT 2021
class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        
        var parent: [Int : Int] = [:]
        for index in 1 ... n  {
            parent[index] = index
        }
        
        func find(_ x: Int) -> Int {
            var x = x
            while let p = parent[x], p != x {
                x = p
            }
            return x
        }
        
        func union(_ x: Int, _ y: Int) {
            let px = find(x)
            let py = find(y)
            for index in 1 ... n {
                if parent[index, default: index] == py {
                    parent[index] = px
                }
            }
        }
        
        var result = [Int]()
        for edge in edges {
            let a = edge[0]
            let b = edge[1]
            if parent[b] != nil, parent[b] == parent[a] {
                result = edge
                continue
            }
            union(a, b)
        }
        return result
    }
}