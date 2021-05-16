/**
 * https://leetcode.com/problems/binary-tree-cameras/
 * 
 * 
 */ 
// Date: Sun May 16 16:56:04 PDT 2021
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
    func minCameraCover(_ root: TreeNode?) -> Int {
        func calc(_ node: TreeNode?) -> (Int, Int, Int) {
            guard let node = node else { return (0, 0, 9999) }
            let left = calc(node.left)
            let right = calc(node.right)

            let d0 = left.1 + right.1
            let d1 = min(left.2 + min(right.1, right.2), right.2 + min(left.1, left.2))
            let d2 = 1 + min(left.0, min(left.1, left.2)) + min(right.0, min(right.1, right.2))
            return (d0, d1, d2)
        } 

        let result = calc(root)
        return min(result.1, result.2)
    }
}