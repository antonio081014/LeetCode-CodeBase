/**
 * https://leetcode.com/problems/insert-into-a-binary-search-tree/
 * 
 * 
 */ 
// Date: Tue Oct  6 08:59:38 PDT 2020
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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        if root.val < val {
            root.right = insertIntoBST(root.right, val)
        } else {
            root.left = insertIntoBST(root.left, val)
        }
        return root
    }
}/**
 * https://leetcode.com/problems/insert-into-a-binary-search-tree/
 * 
 * 
 */ 
// Date: Tue Oct  6 09:17:54 PDT 2020
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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil { return TreeNode(val) }
        var node = root
        while let cnode = node {
            if cnode.val <= val {
                if cnode.right != nil {
                    node = cnode.right
                } else {
                    node?.right = TreeNode(val)
                    break
                }
            } else {
                if cnode.left != nil {
                    node = cnode.left
                } else {
                    node?.left = TreeNode(val)
                    break
                }
            }
        }
        return root
    }
}