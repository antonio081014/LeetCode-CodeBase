/**
 * https://leetcode.com/problems/delete-node-in-a-bst/
 * 
 * 
 */ 
// Date: Mon Aug 31 11:55:53 PDT 2020
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
 /// Great Referenece:
 /// https://www.geeksforgeeks.org/binary-search-tree-set-2-delete/
 ///
 /// - Complexity:
 ///    - Time: O(height of tree)
 ///    - Space: O(1), since most of time, we are using memory in place.
 ///
class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard var root = root else { return nil }
        if root.val > key {
            root.left = deleteNode(root.left, key)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else {
            if root.left == nil {
                return root.right
            }
            if root.right == nil {
                return root.left
            }
            let successorNode = minNode(root.right!)
            root.val = successorNode.val
            root.right = deleteNode(root.right, successorNode.val)
        }
        return root
    }
    
    /// Find the node with minimum value in BST
    /// - Complexity:
    ///     - Time: O(height of tree)
    ///     - Space: O(1)
    private func minNode(_ root: TreeNode) -> TreeNode {
        guard var left = root.left else { return root }
        while let node = left.left { left = node }
        return left
    }
}