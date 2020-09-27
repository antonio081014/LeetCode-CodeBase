/**
 * https://leetcode.com/problems/evaluate-division/
 * 
 * 
 */ 
// Date: Sun Sep 27 11:36:33 PDT 2020
class Solution {
    struct Edge: Hashable, CustomDebugStringConvertible {
        let from: String
        let to: String
        let cost: Double

        func hash(into hasher: inout Hasher) {
            hasher.combine(from)
            hasher.combine(to)
        }

        static func == (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.from == rhs.from && lhs.to == rhs.to
        }

        var debugDescription: String {
            return "Edge (from: \(from) - to: \(to))"
        }
    }
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var graph : [String : Set<Edge>] = [:]
        // O(equations.count)
        for index in 0 ..< equations.count {
            let e = equations[index]
            let v = values[index]
            var set1 = graph[e[0], default: []] 
            set1.insert(Edge(from: e[0], to: e[1], cost: v))
            graph[e[0]] = set1
            
            var set2 = graph[e[1], default: []] 
            set2.insert(Edge(from: e[1], to: e[0], cost: 1.0 / v))
            graph[e[1]] = set2
        }
        // print(graph)
        var result = [Double]()

        // O(The number of all the edges in graph)
        func dfs(from: String, dest: String, value: Double, visited: inout Set<String>) -> Double? {
            if from == dest {
                return value
            }
            for edge in graph[from, default: []] {
                if visited.contains(edge.to) == false {
                    visited.insert(edge.to)
                    if let solution = dfs(from: edge.to, dest: dest, value: value * edge.cost, visited: &visited) {
                        return solution
                    }
                    visited.remove(edge.to)
                }
            }
            return nil
        }

        // O(queries.count * O(dfs))
        for q in queries {
            if graph.keys.contains(q[0]) == false {
                result.append(-1.0)
                continue
            }
            var visited: Set<String> = [q[0]]
            if let solution = dfs(from: q[0], dest: q[1], value: 1.0, visited: &visited) {
                result.append(solution)
            } else {
                result.append(-1.0)
            }
        }
        return result
    }
}