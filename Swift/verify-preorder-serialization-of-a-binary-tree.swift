/**
 * https://leetcode.com/problems/verify-preorder-serialization-of-a-binary-tree/
 * 
 * 
 */ 
// Date: Tue Apr 21 15:41:04 PDT 2020
/// Ref: https://leetcode.com/problems/verify-preorder-serialization-of-a-binary-tree/discuss/78551/7-lines-Easy-Java-Solution
/// Some used stack. Some used the depth of a stack. Here I use a different perspective. In a binary tree, if we consider null as leaves, then
///
/// all non-null node provides 2 outdegree and 1 indegree (2 children and 1 parent), except root
/// all null node provides 0 outdegree and 1 indegree (0 child and 1 parent).
/// Suppose we try to build this tree. During building, we record the difference between out degree and in degree diff = outdegree - indegree. When the next node comes, we then decrease diff by 1, because the node provides an in degree. If the node is not null, we increase diff by 2, because it provides two out degrees. If a serialization is correct, diff should never be negative and diff will be zero when finished.
///
/// - Complexity:
///     - Time: O(n), n is the number elements in the tree.
///     - Space: O(1)
///
class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        let nodes = preorder.split(separator: ",")
        var degree = 1
        for node in nodes {
            degree -= 1
            if degree < 0 { return false }
            degree += node == "#" ? 0 : 2
        }
        return degree == 0
    }
}
/**
 * https://leetcode.com/problems/verify-preorder-serialization-of-a-binary-tree/
 * 
 * 
 */ 
// Date: Tue Apr 21 16:12:15 PDT 2020
/// Using stack.
/// - Complexity:
///     - Time: O(n), n is the number elements in the tree.
///     - Space: O(1)
class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        var stack: [String] = []
        let nodes = preorder.split(separator: ",")
        for node in nodes {
            stack.append(String(node))
            
            if node == "#" {
                // 1,#,2,#,3,#,#
                while stack.count > 2 {
                    let n = stack.count
                    if stack[n - 1] == "#" && stack[n - 2] == "#" && stack[n - 3] != "#" {
                        stack.removeLast()
                        stack.removeLast()
                        stack.removeLast()
                        stack.append(String(node))
                    } else {
                        break
                    }
                }
            }
        }
        return stack.count == 1 && stack[0] == "#"
    }
}
