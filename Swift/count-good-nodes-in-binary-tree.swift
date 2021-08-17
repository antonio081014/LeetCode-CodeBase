/**
 * https://leetcode.com/problems/count-good-nodes-in-binary-tree/
 * 
 * 
 */ 
// Date: Tue Aug 17 10:13:26 PDT 2021
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
    func goodNodes(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode, _ maxV: Int) -> Int {
            var ret = node.val >= maxV ? 1 : 0
            if let left = node.left {
                ret += dfs(left, max(node.val, maxV))
            }
            if let right = node.right {
                ret += dfs(right, max(node.val, maxV))
            }
            return ret
        }
        
        guard let root = root else { return 0 }
        return dfs(root, Int.min)
    }
}