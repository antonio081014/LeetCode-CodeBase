/**
 * https://leetcode.com/problems/erect-the-fence/
 * 
 * 
 */ 
// Date: Mon Sep  6 23:32:44 PDT 2021
/// - Tag: Geometry
class Solution {
    /// Reference: https://leetcode.com/problems/erect-the-fence/solution/
    /// Jarvis Algorithm.
    /// - Complexity:
    ///     - Time: O(n^2), n = trees.count
    ///     - Space: O(n), n = trees.count
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        if trees.count < 4 {
            return Array(Set(trees))
        }
        var hulls = Set<Int>()
        var p = 0
        for index in 0 ..< trees.count {
            if trees[index][0] < trees[p][0] {
                p = index
            }
        }
        let leftMost = p
        // print("LeftMost", leftMost)
        repeat {
            var q = (p + 1) % trees.count
            for index in 0 ..< trees.count {
                if orientation(trees[p], trees[index], trees[q]) < 0 {
                    q = index
                }
            }
            
            for index in 0 ..< trees.count {
                if index != p, index != q, orientation(trees[p], trees[index], trees[q]) == 0, inBetween(trees[p], trees[index], trees[q]) {
                    hulls.insert(index)
                }
            }
            hulls.insert(q)
            // print("q", q)
            p = q
        } while leftMost != p
        // print("So far so good.")
        return Array(hulls).map { trees[$0] }
    }
    
    private func orientation(_ p: [Int], _ q: [Int], _ r: [Int]) -> Int {
        let a = (q[1] - p[1]) * (r[0] - q[0])
        let b = (q[0] - p[0]) * (r[1] - q[1])
        return  a - b ;
    }
    
    private func inBetween(_ p: [Int], _ i: [Int], _ q: [Int]) -> Bool {
        let a = i[0] >= p[0] && i[0] <= q[0] || i[0] <= p[0] && i[0] >= q[0];
        let b = i[1] >= p[1] && i[1] <= q[1] || i[1] <= p[1] && i[1] >= q[1];
        return a && b;
    }
}