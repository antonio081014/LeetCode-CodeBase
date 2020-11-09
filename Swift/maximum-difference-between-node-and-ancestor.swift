/**
 * https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/
 * 
 * 
 */ 
// Date: Mon Nov  9 11:15:25 PST 2020
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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var maxDiff = 0
        func dfs(_ root: TreeNode?, _ maxValue: Int, _ minValue: Int) {
            guard let root = root else { return }
            // print("\(root.val) - \(maxValue) : \(minValue)")
            maxDiff = max(max(abs(root.val - maxValue), abs(root.val - minValue)), maxDiff)
            // print("maxDiff: \(maxDiff)")
            dfs(root.left, max(maxValue, root.val), min(minValue, root.val))
            dfs(root.right, max(maxValue, root.val), min(minValue, root.val))
        }
        guard let root = root else { return maxDiff }
        dfs(root, root.val, root.val)
        return maxDiff
    }
}