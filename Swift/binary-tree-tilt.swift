/**
 * https://leetcode.com/problems/binary-tree-tilt/
 * 
 * 
 */ 
// Date: Thu Oct  8 09:06:29 PDT 2020
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
    func findTilt(_ root: TreeNode?) -> Int {
        var result = 0
        func sum(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let leftSum = sum(node.left)
            let rightSum = sum(node.right)
            result += abs(leftSum - rightSum)
            return node.val + leftSum + rightSum
        }
        sum(root)
        return result
    }
}