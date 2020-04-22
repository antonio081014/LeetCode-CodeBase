/**
 * https://leetcode.com/problems/recover-a-tree-from-preorder-traversal/
 * 
 * 
 */ 
// Date: Wed Apr 22 13:33:13 PDT 2020
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
    func recoverFromPreorder(_ S: String) -> TreeNode? {
        var s = Array(S.map { String($0) })
        var stack: [TreeNode] = []
        var index = 0
        while index < s.count {
            var level = 0
            while index < s.count, s[index] == "-" {
                level += 1
                index += 1
            }
            var num = 0
            while index < s.count, s[index] != "-" {
                num = num * 10 + Int(s[index])!
                index += 1
            }
            
            while stack.count > level {
                stack.removeLast()
            }
            
            let node = TreeNode(num)
            if let last = stack.last {
                if last.left == nil {
                    last.left = node
                } else {
                    last.right = node
                }
            }
            stack.append(node)
        }
        
        return stack.first
    }
}

