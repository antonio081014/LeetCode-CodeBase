/**
 * https://leetcode.com/problems/diameter-of-binary-tree/
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var maxLength = 0
        height(root, &maxLength)
        return maxLength - 1
    }
    
    fileprivate func height(_ root: TreeNode?, _ maxLength: inout Int) -> Int {
        guard let root = root else { return 0 }
        let left = height(root.left, &maxLength)
        let right = height(root.right, &maxLength)
        maxLength = max(maxLength, 1 + left + right)
        return 1 + max(left, right)
    }
}
