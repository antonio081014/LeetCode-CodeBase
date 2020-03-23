/**
 * https://leetcode.com/problems/balance-a-binary-search-tree/
 * 
 * 
 */ 
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    ///
    /// Using inorder traverse to get the sorted array.
    /// Then, re-construct the BST from the sorted array.
    ///
    /// - Complexity;
    ///     - Time: O(n), n is number of nodes in the tree.
    ///     - Space: O(n), n is number of nodes in the tree.
    ///
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var nums: [Int] = []
        
        ///
        /// Traverse tree with inorder.
        ///
        /// - Complexity;
        ///     - Time: O(n), n is number of nodes in the tree.
        ///     - Space: O(n), n is number of nodes in the tree.
        ///
        func inorderTraverse(_ root: TreeNode?) {
            guard let root = root else { return }
            inorderTraverse(root.left)
            nums.append(root.val)
            inorderTraverse(root.right)
        }
        
        /// Build BST from given range, left to right.
        /// Take the middle element as the root value, then
        /// 1. Each elements on the left side of middle element will be used to contruct left subtree.
        /// 2. Each elements on the right side of middle element will be sued to construct right subtree.
        ///
        /// - Parameters:
        ///     - left: lower boundary of sorted array.
        ///     - right: upper boundary of sorted array.
        ///
        /// - Complexity:
        ///     - Time: O(n), n is the number of elements
        ///     - Space: O(n), n is the number of elements
        ///
        func buildTree(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            if left == right { return TreeNode(nums[left]) }
            let mid = (left + right) / 2
            let root = TreeNode(nums[mid])
            root.left = buildTree(left, mid - 1)
            root.right = buildTree(mid + 1, right)
            return root
        }
        
        inorderTraverse(root)
        return buildTree(0, nums.count - 1)
    }
}

