/**
 * https://leetcode.com/problems/same-tree/
 * 
 * 
 */ 
// Date: Mon Jul 13 09:05:27 PDT 2020
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
    /// Recursive solution.
    /// - Complexity:
    ///     - Time: O(n), n is the number of elements in the tree
    ///     - Space: O(height of tree), we might need to go all the way along from root to leaves to find if it's the same.
    ///
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil { return true }
        if p == nil || q == nil { return false }
        if p!.val != q!.val { return false }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
/**
 * https://leetcode.com/problems/same-tree/
 * 
 * 
 */ 
// Date: Mon Jul 13 09:15:49 PDT 2020
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
    /// Iteration solution
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree
    ///     - Space: O(height of tree).
    ///
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queueP = [p]
        var queueQ = [q]
        while queueP.isEmpty == false {
            let node1 = queueP.removeFirst()
            let node2 = queueQ.removeFirst()
            
            if node1 == nil, node2 == nil {}
            else if node1 == nil || node2 == nil { return false }
            else if node1!.val != node2!.val { return false }
            else {
                queueP.append(node1?.left)
                queueQ.append(node2?.left)
                queueP.append(node1?.right)
                queueQ.append(node2?.right)
            }
        }
        return true
    }
}
