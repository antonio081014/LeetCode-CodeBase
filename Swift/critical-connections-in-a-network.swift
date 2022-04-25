class Solution {
    // Ref: https://leetcode.com/problems/critical-connections-in-a-network/discuss/382638/DFS-detailed-explanation-O(orEor)-solution
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var connectionSet: Set<Connection> = Set(connections.map { Connection(from: $0[0], to: $0[1]) })
        var rank = Array(repeating: -2, count: n)
        var graph = Array(repeating: [Int](), count: n)
        for connection in connections {
            graph[connection[0]].append(connection[1])
            graph[connection[1]].append(connection[0])
        }
        
//         print(connectionSet)
//         print(graph)
        
        @discardableResult
        func dfs(_ node: Int, _ depth: Int) -> Int {
            if rank[node] >= 0 { return rank[node] }
            rank[node] = depth
            var minNeighborRank = n
            for neighbor in graph[node] {
                if rank[neighbor] == depth - 1 { continue }
                let neighborRank = dfs(neighbor, depth + 1)
                if neighborRank <= depth {
                    connectionSet.remove(Connection(from: node, to: neighbor))
                }
                minNeighborRank = min(minNeighborRank, neighborRank)
            }
            return minNeighborRank
        }
        
        dfs(0, 0)
        return Array(connectionSet).map { [$0.start, $0.end] }
    }
    
    private struct Connection: Hashable {
        let start: Int
        let end: Int
        
        init(from: Int, to: Int) {
            self.start = min(from, to)
            self.end = max(from, to)
        }
        
        var description: String {
            "\(start) - \(end)"
        }
    }
}
