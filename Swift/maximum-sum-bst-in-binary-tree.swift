/**
 * https://leetcode.com/problems/maximum-sum-bst-in-binary-tree/
 * 
 * 
 */ 
/**
 * https://leetcode.com/problems/maximum-sum-bst-in-binary-tree/
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
    func maxSumBST(_ root: TreeNode?) -> Int {
        self.maxSum = 0
        
        guard let root = root else { return self.maxSum }
        
        self.validBST(root)
        
        return self.maxSum
    }
    
    private var maxSum = 0
    
    private func validBST(_ root: TreeNode) -> (Bool, Int, Int, Int) {
        var isValid = true
        var minV = root.val
        var maxV = root.val
        var sum = root.val
        let leftSum: Int
        let rightSum: Int
        
        if let left = root.left {
            let (lvalid, lmin, lmax, lsum) = self.validBST(left)
            if lmax >= minV { isValid = false }
            else { minV = lmin }
            isValid = lvalid && isValid
            leftSum = lvalid ? lsum : 0
        } else {
            leftSum = 0
        }
        if let right = root.right {
            let (rvalid, rmin, rmax, rsum) = self.validBST(right)
            if rmin <= maxV { isValid = false }
            else { maxV = rmax}
            isValid = rvalid && isValid
            rightSum = rvalid ? rsum : 0
        } else {
            rightSum = 0
        }
        if isValid {
            maxSum = max(maxSum, sum + leftSum + rightSum)
        }
        return (isValid, minV, maxV, isValid ? sum + leftSum + rightSum : 0)
    }
}
