/**
 * https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/
 * 
 * 
 */ 
// Date: Sat Dec 12 23:42:50 PST 2020
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
extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}
class Solution {
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue = [root]
        var path = [root : [root]]
        var level = 0
        while queue.isEmpty == false {
            level += 1
            var size = queue.count
            while size > 0 {
                size -= 1
                let node = queue.removeFirst()
                let parent = path[node, default: [node]]
                if let left = node.left {
                    queue.append(left)
                    path[left] = parent + [left]
                }
                if let right = node.right {
                    queue.append(right)
                    path[right] = parent + [right]
                }
            }
        }
        
        let filteredPaths = (path.filter{ $0.value.count == level }).values
        // print("\(filteredPaths)")
        var index = 0
        repeat {
            var node: TreeNode? = nil
            if (filteredPaths.first?.count) ?? 0 <= index { break }
            for p in filteredPaths {
                if node == nil {
                    node = p[index]
                } else {
                    if p[index].val != node!.val {
                        return p[index - 1]
                    }
                }
            }
            index += 1
        } while true
        return filteredPaths.first?[index - 1]
    }
}