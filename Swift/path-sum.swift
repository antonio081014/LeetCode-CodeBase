/**
 * https://leetcode.com/problems/path-sum/
 * 
 * 
 */ 
// Date: Thu May 21 11:42:30 PDT 2020
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
/// - Complexity:
///     - Time: O(n), n is the number of nodes in the tree.
///     - Space: O(n), n is the number of nodes in the tree.
///
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        var nodeQueue = [root]
        var sumQueue = [root.val]
        
        while nodeQueue.isEmpty == false {
            let node = nodeQueue.removeFirst()
            let sumtmp = sumQueue.removeFirst()
            if node.left == nil, node.right == nil, sumtmp == sum {
                return true
            }
            if let left = node.left {
                nodeQueue.append(left)
                sumQueue.append(sumtmp + left.val)
            }
            if let right = node.right {
                nodeQueue.append(right)
                sumQueue.append(sumtmp + right.val)
            }
        }
        return false
    }
}
