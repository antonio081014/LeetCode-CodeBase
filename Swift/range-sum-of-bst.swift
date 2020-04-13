/**
 * https://leetcode.com/problems/range-sum-of-bst/
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
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var sum = 0
        getSum(root, L, R, &sum)
        return sum
    }
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///     - Space: O(h), h is the height of tree, which is the depth of the stack.
    ///
    fileprivate func getSum(_ root: TreeNode?, _ L: Int, _ R: Int, _ sum: inout Int) {
        guard let root = root else { return }
        if root.val >= L, root.val <= R {
            sum += root.val
        }
        if let left = root.left{
            getSum(left, L, R, &sum)
        }
        if let right = root.right {
            getSum(right, L, R, &sum)
        }
    }
}

class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///     - Space: O(k), k is the maximum number of nodes on one level of the tree.
    ///             k could be n/2.
    ///
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var sum = 0
        guard let root = root else { return sum }
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            if node.val >= L, node.val <= R {
                sum += node.val
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return sum
    }
}
