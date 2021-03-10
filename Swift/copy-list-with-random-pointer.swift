/**
 * https://leetcode.com/problems/copy-list-with-random-pointer/
 * 
 * 
 */ 
// Date: Wed Mar 10 11:03:06 PST 2021
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    var visited: [Node : Node] = [:]
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        if let node = visited[head] { return node }
        let root = Node(head.val)
        visited[head] = root
        root.next = copyRandomList(head.next)
        root.random = copyRandomList(head.random)
        return root
    }
}