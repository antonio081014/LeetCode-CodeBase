/**
 * https://leetcode.com/problems/validate-binary-search-tree/
 * 
 * 
 */ 
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTNode(root).0
    }
    
    func isValidBSTNode(_ root: TreeNode?) -> (Bool, Int?, Int?) {
        if let root = root {
            var min = root.val
            var max = root.val
            
            let left = isValidBSTNode(root.left)
            if !left.0 {return ( false, nil, nil) }
            if let lmax = left.2 {
                if lmax >= root.val {
                    return (false, nil, nil)
                }
            }
            if let lmin = left.1 {
                min = lmin
            }
            
            let right = isValidBSTNode(root.right)
            if !right.0 {return (false, nil, nil)}
            if let rmin = right.1 {
                if rmin <= root.val { return (false, nil, nil) }
            }
            if let rmax = right.2 {
                max = rmax
            }
            return (true, min, max)
        }
        return (true, nil, nil)
    }
}
