/**
 * https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if inorder.isEmpty { return nil }
        var index2Inorder: [Int : Int] = [:]
        for index in 0 ..< inorder.count {
            index2Inorder[inorder[index]] = index
        }
        var index = 0
        return self.process(preorder, &index, 0, inorder.count - 1, index2Inorder)
    }
    
    fileprivate func process(_ list: [Int], _ lastIndex: inout Int, _ left: Int, _ right: Int, _ map: [Int : Int]) -> TreeNode? {
        if right < left { return nil }
        let root = TreeNode(list[lastIndex])
        
        let index = map[list[lastIndex]]!
        lastIndex += 1
        root.left = process(list, &lastIndex, left, index - 1, map)
        root.right = process(list, &lastIndex, index + 1, right, map)
        return root
    }
}
/**
 * https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if let val = preorder.first {
            let root = TreeNode(val)
            for index in 0 ..< inorder.count {
                if inorder[index] == val {
                    root.left = self.buildTree((index >= 1) ? Array(preorder[1 ... index]) : [], (index > 0) ? Array(inorder[0 ..< index]) : [])
                    root.right = (index + 1 < preorder.count) ? self.buildTree(Array(preorder[(index + 1) ..< preorder.count]), Array(inorder[(index + 1) ..< inorder.count])) : nil
                    break
                }
            }
            return root
        }
        return nil
    }
}
