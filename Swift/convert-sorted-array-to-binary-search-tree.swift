/**
 * https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
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
    /// - Complexity:
    ///     - Time: O(n), n is the number of elements
    ///     - Space: O(n), n is the number of elements
    ///     - Stack Space is O(logn), n is the number of elements, logn is the height of BST.
    ///
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {

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
        ///     - Stack Space is O(logn), n is the number of elements, logn is the height of BST.
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

        guard nums.count > 0 else { return nil }
        return buildTree(0, nums.count - 1)
    }
}
