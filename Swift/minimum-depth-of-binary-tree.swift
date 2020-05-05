/**
 * https://leetcode.com/problems/minimum-depth-of-binary-tree/
 * 
 * 
 */ 
// Date: Tue May  5 14:27:25 PDT 2020
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [root]
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var n = queue.count
            while n > 0 {
                n -= 1
                let node = queue.removeFirst()
                if node.left == nil, node.right == nil { return depth }
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        return depth
    }
}
