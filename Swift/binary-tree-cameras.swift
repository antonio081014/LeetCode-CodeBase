/**
 * https://leetcode.com/problems/binary-tree-cameras/
 * 
 * 
 */ 
// Date: Sun May 16 16:56:04 PDT 2021
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

/**
 Let solve(node) be some information about how many cameras it takes to cover the subtree at this node in various states. There are essentially 3 states:

 [State 0] Strict subtree: All the nodes below this node are covered, but not this node.
 [State 1] Normal subtree: All the nodes below and including this node are covered, but there is no camera here.
 [State 2] Placed camera: All the nodes below and including this node are covered, and there is a camera here (which may cover nodes above this node).
 Once we frame the problem in this way, the answer falls out:

 To cover a strict subtree, the children of this node must be in state 1.
 To cover a normal subtree without placing a camera here, the children of this node must be in states 1 or 2, and at least one of those children must be in state 2.
 To cover the subtree when placing a camera here, the children can be in any state.
 */
class Solution {
    func minCameraCover(_ root: TreeNode?) -> Int {
        func calc(_ node: TreeNode?) -> (Int, Int, Int) {
            guard let node = node else { return (0, 0, 9999) }
            let left = calc(node.left)
            let right = calc(node.right)

            let d0 = left.1 + right.1
            let d1 = min(left.2 + min(right.1, right.2), right.2 + min(left.1, left.2))
            let d2 = 1 + min(left.0, min(left.1, left.2)) + min(right.0, min(right.1, right.2))
            return (d0, d1, d2)
        } 

        let result = calc(root)
        return min(result.1, result.2)
    }
}
