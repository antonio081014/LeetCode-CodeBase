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
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        findLevel(root, &result)
        return result
    }
    
    func findLevel(_ root: TreeNode?,  _ list: inout [[Int]]) -> Int {
        guard let root = root else { return -1 }
        let leftLevel = findLevel(root.left, &list)
        let rightLevel = findLevel(root.right, &list)
        let myLevel = 1 + max(leftLevel, rightLevel)
        if myLevel >= list.count {
            list.append([])
        }
        list[myLevel].append(root.val)
        return myLevel
    }
}
