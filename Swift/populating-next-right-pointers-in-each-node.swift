/**
 * https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
 * 
 * 
 */ 
// Date: Tue May 26 12:03:32 PDT 2020
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *       public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue = [root]
        while queue.isEmpty == false {
            var nextQueue: [Node] = []
            for index in 0 ..< queue.count {
                if index == queue.count - 1 {
                    queue[index].next = nil
                } else {
                    queue[index].next = queue[index + 1]
                }
                if let left = queue[index].left {
                    nextQueue.append(left)
                }
                if let right = queue[index].right {
                    nextQueue.append(right)
                }
            }
            queue = nextQueue
            print("Count: \(queue.count)")
        }
        return root
    }
}
