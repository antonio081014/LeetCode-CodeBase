/**
 * https://leetcode.com/problems/minimum-distance-between-bst-nodes/
 * 
 * 
 */ 
// Date: Mon Aug 31 13:28:02 PDT 2020

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
    /// - Complexity: 
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///                   It takes O(n) to complete inorder,
    ///                   Then, takes O(n) to computer minimum differences.
    ///     - Space: O(n), n is the number of nodes in the tree.
    ///                    It stores values in every node.
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var list = [Int]()

        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }
            inorder(root.left)
            list.append(root.val)
            inorder(root.right)
        }
        inorder(root)

        var minDiff = Int.max
        for index in stride(from: 1, to: list.count, by: +1 ) {
            minDiff = min(minDiff, list[index] - list[index - 1])
        }
        return minDiff
    }
}