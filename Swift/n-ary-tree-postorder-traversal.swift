/**
 * https://leetcode.com/problems/n-ary-tree-postorder-traversal/
 * 
 * 
 */ 
// Date: Tue Apr 20 15:25:39 PDT 2021
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
    func postorder(_ root: Node?) -> [Int] {
    	var result = [Int]()
        guard let root = root else { return result }
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeLast()
            result.append(node.val)
            for index in stride(from: 0, to: node.children.count, by: 1) {
                queue.append(node.children[index])
            }
        }
        return result.reversed()
    }
}