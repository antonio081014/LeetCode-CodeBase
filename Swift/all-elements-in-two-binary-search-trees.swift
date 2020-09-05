/**
 * https://leetcode.com/problems/all-elements-in-two-binary-search-trees/
 * 
 * 
 */ 
// Date: Sat Sep  5 15:52:34 PDT 2020
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
/// - Complexity:
///     - Time: O(n + m + m(logn + n)), n and m are the number of nodes in root1 and root2.
///         Traverse two trees takes O(n) and O(m) time, then insert every value from list2 with binary search will take O(mlogn)
///         Also, insertion takes linear time actually.
///     - Space: O(m + n).
class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        func traverse(_ root: TreeNode?, _ result: inout [Int]) {
            guard let root = root else { return }
            traverse(root.left, &result)
            result.append(root.val)
            traverse(root.right, &result)
        }
        var list1 = [Int]()
        var list2 = [Int]()
        traverse(root1, &list1)
        traverse(root2, &list2)
        for n in list2 {
            var left = 0
            var right = list1.count
            while left < right {
                let mid = left + (right - left) / 2
                if list1[mid] >= n {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            list1.insert(n, at: left)
        }
        return list1
    }
}