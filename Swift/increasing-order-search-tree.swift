/**
 * https://leetcode.com/problems/increasing-order-search-tree/
 * 
 * 
 */ 
// Date: Thu Dec  3 11:11:21 PST 2020
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var nodeList: [TreeNode] = []
        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }
            inorder(root.left)
            nodeList.append(root)
            inorder(root.right)
        }
        inorder(root)
        var index = 0
        while index < nodeList.count - 1 {
            nodeList[index].left = nil
            nodeList[index].right = nodeList[index + 1]
            index += 1
        }
        nodeList[index].left = nil
        nodeList[index].right = nil
        return nodeList.first
    }
}