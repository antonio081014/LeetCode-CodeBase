/**
 * https://leetcode.com/problems/recover-binary-search-tree/
 * 
 * 
 */ 
// Date: Sat Jun 27 11:50:19 PDT 2020
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
    
    var firstNode: TreeNode?
    var secondNode: TreeNode?
    var prevNode: TreeNode!
    
    func recoverTree(_ root: TreeNode?) {
        prevNode = TreeNode(Int.min)
        traverse(root)
        let tmpVal = firstNode?.val
        firstNode?.val = secondNode!.val
        secondNode?.val = tmpVal!
    }
    
    private func traverse(_ root: TreeNode?) {
        guard let root = root else { return }
        
        self.traverse(root.left)
        
        if firstNode == nil, prevNode.val >= root.val {
            firstNode = prevNode
        }
        if firstNode != nil, prevNode.val >= root.val {
            secondNode = root
        }
        
        prevNode = root
        
        self.traverse(root.right)
    }
}