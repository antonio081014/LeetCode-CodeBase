/**
 * https://leetcode.com/problems/sum-root-to-leaf-numbers/
 * 
 * 
 */ 
// Date: Fri Jun 26 09:12:01 PDT 2020
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
    /// Recursively traverse from root to leaf, get the number and add it to sum when hitting the leaf.
    /// - Complexity: 
    ///     - Time: O(n), visiting every node in the tree.
    ///     - Space: O(height of tree), always keep the number along the path from root to leaf.
    func sumNumbers(_ root: TreeNode?) -> Int {
        func sumTree(_ root: TreeNode?, _ pathSum: Int, _ sum: inout Int) {
            guard let root = root else { return }
            if root.left == nil, root.right == nil {
                sum += pathSum * 10 + root.val
                return
            }
            sumTree(root.left, pathSum * 10 + root.val, &sum)
            sumTree(root.right, pathSum * 10 + root.val, &sum)
        }
        
        var sum = 0
        sumTree(root, 0, &sum)
        return sum
    }
}
