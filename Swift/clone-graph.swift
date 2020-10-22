/**
 * https://leetcode.com/problems/clone-graph/
 * 
 * 
 */ 
// Date: Thu Oct 22 10:44:31 PDT 2020
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

/// DFS with memorized nodes.
/// DFS could simply result to endless loop in a cycle, which is why we memorized all the visied nodes.
/// - Complexity:
///     - Time: O(E + V), try visit all the nodes and edges connecting two nodes.
///     - Space: O(E + V), since we need to make a copy. No extra.
class Solution {
    var visitedNode: [Int: Node] = [:]
    
    func cloneGraph(_ node: Node?) -> Node? {
        guard let val = node?.val else { return nil }
        if let cloneNode = visitedNode[val] { return cloneNode }
        
        let root = Node(val)
        visitedNode[val] = root
        for neighbor in node?.neighbors ?? [] {
            if let cloneNeighbor = cloneGraph(neighbor) {
                root.neighbors.append(cloneGraph(neighbor))
            }
        }
        return root
    }
}/**
 * https://leetcode.com/problems/clone-graph/
 * 
 * 
 */ 
// Date: Thu Oct 22 11:23:07 PDT 2020
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */
///
/// BFS, traverse all the nodes and edges from starting node.
///
/// - Complexity:
///     - Time: O(E + V)
///     - Space: O(E + V)
class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let val = node?.val else { return nil }
        var visited: [Int : Node] = [:]
        let root = Node(val)
        visited[val] = root
        // Keep original nodes in the queue, 
        // while keep all the new created nodes in the visited dictionary.
        var queue: [Node] = [node!]
        while let first = queue.first {
            queue.removeFirst()
            for neighbor in first.neighbors where neighbor != nil {
                if visited[neighbor!.val] == nil {
                    queue.append(neighbor!)
                    visited[neighbor!.val] = Node(neighbor!.val)
                }
                if let cloneNode = visited[first.val], let nextNode = visited[neighbor!.val] {
                    cloneNode.neighbors.append(nextNode)
                }
            }
        }
        return root
    }
}