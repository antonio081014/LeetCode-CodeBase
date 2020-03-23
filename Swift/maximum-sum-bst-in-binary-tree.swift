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

 /**
  *
  *  
  */
class Solution {
    func maxSumBST(_ root: TreeNode?) -> Int {
        // Init.
        self.maxSum = 0
        
        guard let root = root else { return self.maxSum }
        
        self.validBST(root)
        
        return self.maxSum
    }
    
    /// The max sum value of a valid BST or sub BST.
    private var maxSum = 0
    
    /// Go through every node of tree with DFS.
    /// Check on the validation of both left subtree and right subtree while calculating the sum of each subtrees.
    /// If both of subtrees are valid and current tree is also valid, compare the maxSum with sum for current tree, rooted from `root`
    /// Otherwise, current tree should contribute nothing for the sum of this tree, which might be the subtree of another node.
    /// 
    /// - Parameters:
    ///     - root: Current tree root.
    ///
    /// - Returns:
    ///     - Validation: if subtree rooted from current `root` is valid.
    ///     - Minimum: min value of tree rooted from `root`.
    ///     - Maximum: max value of tree rooted from `root`
    ///     - Sum: the sum of every TreeNode child, including `root`
    ///
    /// - Complexity: O(n), n is the number of nodes in this tree rooted from `root`
    ///
    private func validBST(_ root: TreeNode) -> (Bool, Int, Int, Int) {
        var isValid = true
        var minV = root.val
        var maxV = root.val
        var sum = root.val
        let leftSum: Int
        let rightSum: Int
        
        /// If `root` has left child.
        if let left = root.left {
            let (lvalid, lmin, lmax, lsum) = self.validBST(left)
            if lmax >= minV { isValid = false }
            else { minV = lmin }
            isValid = lvalid && isValid
            leftSum = lvalid ? lsum : 0
        } else {
            leftSum = 0
        }
        
        /// If `root` has right child.
        if let right = root.right {
            let (rvalid, rmin, rmax, rsum) = self.validBST(right)
            if rmin <= maxV { isValid = false }
            else { maxV = rmax}
            isValid = rvalid && isValid
            rightSum = rvalid ? rsum : 0
        } else {
            rightSum = 0
        }
        
        /// If current tree rooted from `root` is a valid BST.
        if isValid {
            sum += leftSum + rightSum
            maxSum = max(maxSum, sum)
        } else {
            sum = 0
        }
        
        return (isValid, minV, maxV, sum)
    }
}
