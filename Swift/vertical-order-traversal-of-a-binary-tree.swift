/**
 * https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/
 * 
 * 
 */ 
// Date: Fri Aug  7 10:37:16 PDT 2020
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
    /// Basically, the idea is
    /// 1. Go through every node in the tree.
    /// 2. Mark each node with (x, y) like CGPoint.
    /// 3. Sort the result based on its (x, y)
    ///
    /// - Complexity:
    ///     - Time: O(n + nlogn) => O(nlogn)
    ///     - Space: O(n), each node we have x, y and value.
    ///
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var pos2list: [Int : [(Int, Int)]] = [:]
        guard let root = root else { return [] }
        var queue = [(0, 0, root)]
        while queue.isEmpty == false {
            let (x, y, node) = queue.removeFirst()
            pos2list[x] = pos2list[x, default: [(Int, Int)]()] + [(y, node.val)]
            if let left = node.left {
                queue.append((x - 1, y + 1, left))
            }
            if let right = node.right {
                queue.append((x + 1, y + 1, right))
            }
        }

        // result: [[(Int, Int)]], a list of
        var result = pos2list.sorted(by: {$0.key < $1.key}).map {$0.value}
        for index in 0 ..< result.count {
            result[index] = result[index].sorted(by: { listA, listB in
                if listA.0 == listB.0 {
                    return listA.1 < listB.1
                }
                return listA.0 < listB.0
            })
        }
        return result.map({$0.map {$0.1}})
    }
}

/**
 * https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/
 * 
 * 
 */ 
// Date: Fri Jan 29 17:02:41 PST 2021
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
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var ranking: [Int : [(Int, Int)]] = [:]
        func dfs(_ root: TreeNode?, _ rank: Int, _ y: Int) {
            guard let root = root else { return }
            ranking[rank, default: []].append((y, root.val))
            dfs(root.left, rank - 1, y + 1)
            dfs(root.right, rank + 1, y + 1)
        }
        
        dfs(root, 0, 0)
        return ranking.sorted { $0.key < $1.key }.map { $0.value.sorted { $0.0 == $1.0 ? ($0.1 < $1.1) : ($0.0 < $1.0) }.map { $0.1 } }
    }
}