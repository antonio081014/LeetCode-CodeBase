/**
 * https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
 * 
 * 
 */ 
// Date: Thu Jul  2 10:27:48 PDT 2020
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
    /// Non recursively to traverse tree in preorder
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree
    ///     - Space: O(height of tree)
    ///
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        var queue = [root]
        var prevNode: TreeNode = TreeNode()
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            prevNode.left = nil
            prevNode.right = node
            prevNode = node
            if let right = node.right {
                queue.insert(right, at: 0)
            }
            if let left = node.left {
                queue.insert(left, at: 0)
            }
        }
        prevNode.left = nil
        prevNode.right = nil
    }
}
