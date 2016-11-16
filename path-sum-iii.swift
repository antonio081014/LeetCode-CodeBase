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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        if let root = root {
            return pathSum(root, sum, false)
        }
        return 0
    }
    
    private func pathSum(_ root: TreeNode?, _ sum: Int, _ changed: Bool) -> Int {
        var count = sum == root!.val ? 1 : 0
        
        if let left = root!.left {
            count += pathSum(left, sum - root!.val, true)
            if !changed {
                count += pathSum(left, sum, false)
            }
        }
        if let right = root!.right {
            count += pathSum(right, sum - root!.val, true)
            if !changed {
                count += pathSum(right, sum, false)
            }
        }
        return count
    }
}
