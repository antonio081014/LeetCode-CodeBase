/**
 * https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 * 
 * 
 */ 
// Date: Mon Jul 19 09:12:40 PDT 2021
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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if p!.val > q!.val {
            return lowestCommonAncestor(root, q, p)
        }
        if root.val >= p!.val, root.val <= q!.val { return root }
        else if root.val >= q!.val {
            return lowestCommonAncestor(root.left, p, q)
        } else {
            return lowestCommonAncestor(root.right, p, q)
        }
    }
}/**
 * https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 * 
 * 
 */ 
// Date: Mon Jul 19 09:17:09 PDT 2021
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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let pv = min(p!.val, q!.val)
        let qv = max(p!.val, q!.val)
        
        var resultNode = root
        while let node = resultNode {
            if node.val >= pv, node.val <= qv { return node }
            if node.val >= qv {
                resultNode = node.left
            } else {
                resultNode = node.right
            }
        }
        return nil
    }
}