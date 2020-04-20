/**
 * https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.isEmpty { return nil }
        let root = TreeNode(preorder[0])
        var left = 1
        var right = preorder.count
        while left < right {
            let mid = left + (right - left) / 2
            if preorder[mid] < preorder[0] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        if left > 1 {
            root.left = bstFromPreorder(Array(preorder[1 ..< left]))
        }
        if left < preorder.count {
            root.right = bstFromPreorder(Array(preorder[left ..< preorder.count]))
        }
        return root
    }
}
