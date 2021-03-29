/**
 * https://leetcode.com/problems/flip-binary-tree-to-match-preorder-traversal/
 * 
 * 
 */ 
// Date: Mon Mar 29 10:34:45 PDT 2021
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
    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        var index = 0
        var result: [Int] = []
        
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            if root.val != voyage[index] {
                index += 1
                result = [-1]
                return
            }
            index += 1
            if index < voyage.count, let left = root.left, left.val != voyage[index] {
                result.append(root.val)
                dfs(root.right)
                dfs(root.left)
            } else {
                dfs(root.left)
                dfs(root.right)
            }
        }
        
        
        dfs(root)
        print(result)
        if let first = result.first, first == -1 {
            result = [-1]
        }
        return result
    }
}