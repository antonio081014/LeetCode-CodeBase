/**
 * https://leetcode.com/problems/count-complete-tree-nodes/
 * 
 * 
 */ 
// Date: Sun Oct 24 19:49:18 PDT 2021
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
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var leftNode = root
        var rightNode = root
        var left = 0
        var right = 0
        while leftNode != nil {
            left += 1
            leftNode = leftNode?.left
        }
        while rightNode != nil {
            right += 1
            rightNode = rightNode?.right
        }
        if left == right { return Int(pow(2, Double(left))) - 1 }
        return 1 + self.countNodes(root?.left) + self.countNodes(root?.right)
    }
}