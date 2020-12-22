/**
 * https://leetcode.com/problems/balanced-binary-tree/
 * 
 * 
 */ 
// Date: Tue Dec 22 08:26:08 PST 2020
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        func heightBalanced(_ root: TreeNode?) -> (Bool, Int) {
            guard let root = root else { return (true, 0) }
            let (leftBalanced, lHeight) = heightBalanced(root.left)
            let (rightBalanced, rHeight) = heightBalanced(root.right)
            if leftBalanced == false || rightBalanced == false { return (false, 0) }
            if abs(lHeight - rHeight) > 1 { return (false, 0) }
            return (true, max(lHeight, rHeight) + 1)
        }
        return heightBalanced(root).0
    }
}