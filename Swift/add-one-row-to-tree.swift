/**
 * https://leetcode.com/problems/add-one-row-to-tree/
 * 
 * 
 */ 
// Date: Tue Mar  9 13:36:32 PST 2021
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
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        if d == 1 {
            return TreeNode(v, root, nil)
        } else if d == 2 {
            let left = root?.left
            let right = root?.right
            root?.left = TreeNode(v, left, nil)
            root?.right = TreeNode(v, nil, right)
            return root
        }
        root?.left = addOneRow(root?.left, v, d - 1)
        root?.right = addOneRow(root?.right, v, d - 1)
        return root
    }
}