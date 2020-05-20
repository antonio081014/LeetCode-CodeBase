/**
 * https://leetcode.com/problems/kth-smallest-element-in-a-bst/
 * 
 * 
 */ 
// Date: Wed May 20 09:32:12 PDT 2020
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
    /// Inorder traverse BST,
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var queue: [TreeNode] = []
        var node = root
        while true {
            while node != nil {
                queue.insert(node!, at: 0)
                node = node?.left
            }
            count += 1
            node = queue.removeFirst()
            if count >= k {
                return node?.val ?? 0
            }
            node = node?.right
        }
        return 0
    }
}
