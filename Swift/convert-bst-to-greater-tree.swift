/**
 * https://leetcode.com/problems/convert-bst-to-greater-tree/
 * 
 * 
 */ 
// Date: Tue Apr 21 13:43:54 PDT 2020
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
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        
        func getSum(_ root: inout TreeNode?, _ sum: Int = 0) -> Int {
            guard var root = root else { return 0 }
            let rsum = getSum(&root.right, sum)
            let lsum = getSum(&root.left, root.val + sum + rsum)
            root.val = rsum + root.val + sum
            return lsum + root.val - sum
        }
        
        var root = root
        getSum(&root)
        return root
    }
}
