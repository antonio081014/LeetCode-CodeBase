/**
 * https://leetcode.com/problems//maximum-depth-of-n-ary-tree/
 * 
 * 
 */ 
// Date: Tue May  5 14:29:15 PDT 2020
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        var queue = [root]
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var n = queue.count
            while n > 0 {
                n -= 1
                let node = queue.removeFirst()
                for child in node.children {
                    queue.append(child)
                }
            }
        }
        return depth
    }
}
/**
 * https://leetcode.com/problems/maximum-depth-of-n-ary-tree/
 * 
 * 
 */ 
// Date: Tue May  5 14:31:31 PDT 2020
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        var maxDep = 0
        for child in root.children {
            maxDep = max(maxDep, maxDepth(child))
        }
        return 1 + maxDep
    }
}
