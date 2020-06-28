/**
 * https://leetcode.com/problems/reconstruct-itinerary/
 * 
 * 
 */ 
// Date: Sun Jun 28 10:09:06 PDT 2020
class Solution {
    /// This problem is about using all the tickets the man have and only once.
    /// Basic idea is to use DFS to use each ticket travel from city to city.
    /// Once we used all the tickets in hand, return the path.
    /// This is a graph problem, where you need to visit all the edges in the graph only once.
    /// Then, return the path where you along your visit.
    ///
    /// So, the key part is keep the path along the visit and keep track on the tickets has been used/left.
    /// 
    /// - Complexity: 
    ///     - Time: O(n), n is the number of tickets.
    ///     - Space: O(n), n is the number of tickets. We could possibly visit each city like a straight line while using ticket once.
    ///
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var graph: [String: [String]] = [:]
        var cities: Set<String> = []
        for ticket in tickets {
            let from = ticket[0]
            let to = ticket[1]
            var paths = graph[from, default: []]
            paths.append(to)
            graph[from] = paths.sorted()
            cities.insert(from)
            cities.insert(to)
        }
        var path = ["JFK"]
        func visitCity(from: String) -> Bool {
            if graph.isEmpty {
                return true
            }
            var dest = graph[from, default: []]
            if dest.count == 0 { return false }
            for index in 0 ..< dest.count {
                let to = dest.remove(at: index)
                graph[from] = dest.isEmpty ? nil : dest
                path.append(to)
                if visitCity(from: to) { return true }
                dest.insert(to, at: index)
                path.removeLast()
                graph[from] = dest
            }
            return false
        }
        visitCity(from: "JFK")
        return path
    }
}
