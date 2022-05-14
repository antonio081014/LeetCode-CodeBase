/**
 * https://leetcode.com/problems/network-delay-time/
 * 
 * 
 */ 
// Date: Fri May 13 21:14:57 PDT 2022
class Solution {
    
    struct Edge {
        let dest: Int
        let cost: Int
    }
    /// - Complexity:
    ///     - Time: O(V * E), where V = n, E = times.count
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var graph = Array(repeating: [Edge](), count: n)
        for time in times {
            graph[time[0] - 1].append(Edge(dest: time[1] - 1, cost: time[2]))
        }
        var timeCost = Array(repeating: Int.max, count: n)
        timeCost[k - 1] = 0
        var queue = [k - 1]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            for edge in graph[node] {
                let cost = timeCost[node] + edge.cost
                if cost < timeCost[edge.dest] {
                    timeCost[edge.dest] = cost
                    queue.append(edge.dest)
                }
            }
        }
        
        var result = 0
        for index in 0 ..< n {
            result = max(result, timeCost[index])
        }
        
        return result == Int.max ? -1 : result
    }
}