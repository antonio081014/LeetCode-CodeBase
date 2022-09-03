/**
 * https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another/
 * 
 * 
 */ 
// Date: Sat Sep  3 13:40:47 PDT 2022
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
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        func getPath(_ root: TreeNode, _ target: Int) -> String? {
            if root.val == target { return "" }
            if let left = root.left, let leftPath = getPath(left, target) {
                    return "L" + leftPath
            }
            if let right = root.right, let rightPath = getPath(right, target) {
                    return "R" + rightPath
            }
            return nil
        }
        
        guard let root = root else { return "" }
        guard var startPath = getPath(root, startValue), var destPath = getPath(root, destValue) else { return "" }
        
        while let startFirst = startPath.first, let destFirst = destPath.first, startFirst == destFirst {
            startPath.removeFirst()
            destPath.removeFirst()
        }
        
        var result = ""
        for _ in 0 ..< startPath.count {
            result += "U"
        }
        
        result += destPath
        
        return result
        
    }
}
