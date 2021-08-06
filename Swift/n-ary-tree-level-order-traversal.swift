/**
 * https://leetcode.com/problems/n-ary-tree-level-order-traversal/
 * 
 * 
 */ 
// Date: Fri Aug  6 09:22:18 PDT 2021
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        var queue = [root]
        while queue.isEmpty == false {
            var levelRet = [Int]()
            var size = queue.count
            while size > 0 {
                let node = queue.removeFirst()
                levelRet.append(node.val)
                size -= 1
                for child in node.children {
                    queue.append(child)
                }
            }
            result.append(levelRet)
        }
        return result
    }
}