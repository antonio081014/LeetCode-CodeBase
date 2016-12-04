/**
 * Problem Link: https://leetcode.com/problems/sum-of-left-leaves/
 *
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return sumOfLeftLeaves(root, false)
    }
    
    private func sumOfLeftLeaves(_ root: TreeNode?, _ isLeft: Bool) -> Int {
        if let root = root {
            var sum = 0
            if isLeft && root.left == nil && root.right == nil {
                sum += root.val
                return sum
            }
            sum += sumOfLeftLeaves(root.left, true)
            sum += sumOfLeftLeaves(root.right, false)
            return sum
        }
        return 0
    }
}
