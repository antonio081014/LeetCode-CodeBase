/**
 * https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
 * 
 * 
 */ 
// Date: Mon May 25 15:30:48 PDT 2020
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
///
/// Level-Traverse Binary Tree, fill null when no node exisit there
/// Pretty much like a heap.
/// This solution will get TLE, since there is a case, where every element has a right child only, but the tree is very high, thus,
/// The level order will generate a large string to store every empty node.
///
class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var ret: [String] = []
        var queue = [root]
        while queue.isEmpty == false {
            var n = queue.count
            var nextLevel = false
            while n > 0 {
                n -= 1
                let node = queue.removeFirst()
                if let node = node {
                    if node.left != nil {
                        nextLevel = true
                    }
                    if node.right != nil {
                        nextLevel = true
                    }
                    ret.append("\(node.val)")
                    queue.append(node.left)
                    queue.append(node.right)
                } else {
                    ret.append("null")
                    queue.append(nil)
                    queue.append(nil)
                }
            }
            if nextLevel == false { break }
        }
        // while let last = ret.last, last == "null" {
        //     ret.removeLast()
        // }
        return "[" + ret.joined(separator: ",") + "]"
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var tmpdata = data
        tmpdata.removeFirst()
        tmpdata.removeLast()
        let data = tmpdata.split(separator: ",").map { String($0) }
        guard let first = data.first, first != "null" else { return nil }
        var queue: [TreeNode?] = [TreeNode(Int(first)!)]
        for index in 1 ..< data.count {
            let parentIndex = (index - 1) / 2
            let node: TreeNode?
            if data[index] == "null" {
                node = nil
            } else {
                node = TreeNode(Int(data[index])!)
            }
            if index == parentIndex * 2 + 1 {
                queue[parentIndex]?.left = node
            } else {
                queue[parentIndex]?.right = node
            }
            queue.append(node)
        }
        
        return queue.first!
    }
}

///
/// Preorder- Traverse.
///
class Codec {
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///     - Space: O(n), n is the number of nodes in the tree.
    ///
    func serialize(_ root: TreeNode?) -> String {
        var ret: [String] = []
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            if let node = node {
                ret.append("\(node.val)")
                queue.insert(node.right, at: 0)
                queue.insert(node.left, at: 0)
            } else {
                ret.append("null")
            }
        }
        return ret.joined(separator: ",")
    }
    
    /// - Complexity:
    ///     - Time: O(n), n is the length of comma seperated Array.
    ///     - Space: O(log(n)), which is the height of the tree.
    ///
    func deserialize(_ data: String) -> TreeNode? {
        func build(_ data: [String], at index: inout Int) -> TreeNode? {
            let content = data[index]
            index += 1
            if content == "null" { return nil }
            let node = TreeNode(Int(content)!)
            node.left = build(data, at: &index)
            node.right = build(data, at: &index)
            return node
        }
        
        let data = data.split(separator: ",").map { String($0) }
        var index = 0
        let node = build(data, at: &index)
        return node
    }
}
