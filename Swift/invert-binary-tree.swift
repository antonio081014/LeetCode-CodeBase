/**
 * https://leetcode.com/problems/invert-binary-tree/
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
    func invertTree(_ r: TreeNode?) -> TreeNode? {
        guard let root = r else {
            return r
        }
        var head = root
        let left = invertTree(head.right)
        let right = invertTree(head.left)
        head.left = left
        head.right = right
        return head
    }
    
    // Non-recursive Solution.
    func invertTree(_ r: TreeNode?) -> TreeNode? {
        guard let root = r else {
            return r
        }
        
        var head = root
        var stack = [TreeNode]()
        stack += [root]
        
        while !stack.isEmpty {
            var node = stack.popLast()!
            let left = node.left
            node.left = node.right
            node.right = left
            
            if let left = node.left {
                stack += [left]
            }
            if let right = node.right {
                stack += [right]
            }
        }
        return head
    }
}
