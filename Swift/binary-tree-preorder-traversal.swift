/**
 * https://leetcode.com/problems/binary-tree-preorder-traversal/
 * 
 * 
 */ 
// Date: Sun May 10 16:35:25 PDT 2020
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
    /// Recursive solution.
    /// Visit root -> left -> right
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        return [root.val] + self.preorderTraversal(root.left) + self.preorderTraversal(root.right)
    }
}
/**
 * https://leetcode.com/problems/binary-tree-preorder-traversal/
 * 
 * 
 */ 
// Date: Sun May 10 16:39:59 PDT 2020
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
    /// Iterative solution.
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree
    ///     - Space: O(n), n is the number of nodes in the tree
    ///
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        guard let root = root else { return result }
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            result.append(node.val)
            if let right = node.right {
                queue.insert(right, at: 0)
            }
            if let left = node.left {
                queue.insert(left, at: 0)
            }
        }
        return result
    }
}
