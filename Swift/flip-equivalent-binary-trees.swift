/**
 * https://leetcode.com/problems/flip-equivalent-binary-trees/
 * 
 * 
 */ 
// Date: Wed Jul 22 15:29:48 PDT 2020
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
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard 
            let r1 = root1, 
            let r2 = root2 
            else {
                return root1 == nil && root2 == nil
        }
        
        if r1.val != r2.val { return false }
        return (flipEquiv(r1.left, r2.left) && flipEquiv(r1.right, r2.right)) || (flipEquiv(r1.left, r2.right) && flipEquiv(r1.right, r2.left))
    }
}
