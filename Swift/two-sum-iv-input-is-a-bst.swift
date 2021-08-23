/**
 * https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
 * 
 * 
 */ 
// Date: Mon Aug 23 09:34:50 PDT 2021
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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }
        // if root.val < k { return findTarget(root.right, k) }
        // if root.val > k { return findTarget(root.left, k) }
        var target: Set<Int> = []
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            if target.contains(node.val) { return true }
            target.insert(k - node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return false
    }
}