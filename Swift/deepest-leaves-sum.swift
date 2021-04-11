/**
 * https://leetcode.com/problems/deepest-leaves-sum/
 * 
 * 
 */ 
// Date: Sun Apr 11 10:58:30 PDT 2021
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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var result = 0
        var queue = [root]
        while queue.isEmpty == false {
            var size = queue.count
            var sum = 0
            while size > 0 {
                let node = queue.removeFirst()
                sum += node.val
                size -= 1
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            result = sum
        }
        return result
    }
}