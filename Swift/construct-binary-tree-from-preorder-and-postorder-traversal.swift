/**
 * https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/
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
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        if pre.isEmpty { return nil }
        var index2post: [Int : Int] = [:]
        for index in 0 ..< post.count {
            index2post[post[index]] = index
        }
        var index = 0
        return self.process(pre, &index, 0, post.count - 1, index2post)
    }
    
    fileprivate func process(_ list: [Int], _ firstIndex: inout Int, _ left: Int, _ right: Int, _ map: [Int : Int]) -> TreeNode? {
        if right < left { return nil }
        let root = TreeNode(list[firstIndex])
        firstIndex += 1
        
        if left == right {
            return root
        }
        
        let index = map[list[firstIndex]]!
        
        
        root.left = process(list, &firstIndex, left, index, map)
        root.right = process(list, &firstIndex, index + 1, right - 1, map)
        return root
    }
}
