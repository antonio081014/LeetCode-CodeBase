/**
 * https://leetcode.com/problems/maximum-depth-of-binary-tree/
 * 
 * 
 */ 
// Date: Tue May  5 14:15:14 PDT 2020
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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
}
/**
 * https://leetcode.com/problems/maximum-depth-of-binary-tree/
 * 
 * 
 */ 
// Date: Tue May  5 14:23:54 PDT 2020
class Solution {
    /// Non-recursive method by using queue level traverse a tree.
    ///  - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree
    ///     - Space: O(n/2), n/2 is the number of leaf nodes for a full binary tree.
    ///
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [root]
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var n = queue.count
            while n > 0 {
                n -= 1
                let node = queue.removeFirst()
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        return depth
    }
}
