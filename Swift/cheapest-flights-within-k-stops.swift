/**
 * https://leetcode.com/problems/cheapest-flights-within-k-stops/
 * 
 * 
 */ 
// Date: Sun Jun 14 22:12:04 PDT 2020
class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var cost = Array(repeating: Array(repeating: -1, count: n), count: n)
        for flight in flights {
            cost[flight[0]][flight[1]] = flight[2]
        }
        var result = Array(repeating: Int.max, count: n)
        /// source, cost from source, k stops
        var queue = [(src, 0, 0)]
        result[src] = 0
        while queue.isEmpty == false {
            var size = queue.count
            while size > 0 {
                size -= 1
                let (node, cst, step) = queue.removeFirst()
                for next in 0 ..< n {
                    if cost[node][next] >= 0, step <= K, cst + cost[node][next] < result[next] {
                        result[next] = cst + cost[node][next]
                        if result[next] < result[dst] {
                            queue.append((next, cst + cost[node][next], step + 1))
                        }
                    }
                }
            }
        }
        return result[dst] == Int.max ? -1 : result[dst]
    }
}