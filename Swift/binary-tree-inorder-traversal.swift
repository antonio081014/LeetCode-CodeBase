/**
 * https://leetcode.com/problems/binary-tree-inorder-traversal/
 * 
 * 
 */ 
// Date: Sun May 10 17:10:54 PDT 2020
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        return self.inorderTraversal(root.left) + [root.val] + self.inorderTraversal(root.right)
    }
}
/**
 * https://leetcode.com/problems/binary-tree-inorder-traversal/
 * 
 * 
 */ 
// Date: Mon May 11 16:02:21 PDT 2020
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
    /// Iterative solution.
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()
        var stack: [TreeNode] = []
        self.pushAllLeftChildren(root, into: &stack)
        while stack.isEmpty == false {
            let node = stack.removeLast()
            result.append(node.val)
            self.pushAllLeftChildren(node.right, into: &stack)
        }
        return result
    }
    
    fileprivate func pushAllLeftChildren(_ root: TreeNode?, into stack: inout [TreeNode]) {
        var node = root
        while let cNode = node {
            stack.append(cNode)
            node = cNode.left
        }
    }
}
