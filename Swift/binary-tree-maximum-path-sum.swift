/**
 * https://leetcode.com/problems/binary-tree-maximum-path-sum/
 * 
 * 
 */ 
// Date: Wed Apr 29 10:02:51 PDT 2020
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
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min
        self.pathSum(root, &result)
        return result
    }
    
    fileprivate func pathSum(_ root: TreeNode?, _ result: inout Int) -> Int {
        guard let root = root else { return 0 }
        let left = max(0, pathSum(root.left, &result))
        let right = max(0, pathSum(root.right, &result))
        result = max(result, root.val + left + right)
        
        return root.val + max(left, right)
    }
}
