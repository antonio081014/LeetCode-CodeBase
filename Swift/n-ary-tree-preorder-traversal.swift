/**
 * https://leetcode.com/problems/n-ary-tree-preorder-traversal/
 * 
 * 
 */ 
// Date: Tue Apr 20 15:22:37 PDT 2021
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
    func preorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        guard let root = root else { return result }
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeLast()
            result.append(node.val)
            for index in stride(from: node.children.count - 1, through: 0, by: -1) {
                queue.append(node.children[index])
            }
        }
        return result
    }
}