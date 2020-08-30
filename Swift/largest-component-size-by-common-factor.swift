/**
 * https://leetcode.com/problems/largest-component-size-by-common-factor/
 * 
 * 
 */ 
// Date: Sun Aug 30 14:11:01 PDT 2020
/// Permutation with DFS will NOT work, TLE.
class Solution {
    func largestComponentSize(_ A: [Int]) -> Int {
        var map: [Int : [Int]] = [:]
        for i in 0 ..< A.count - 1 {
            for j in i + 1 ..< A.count {
                if gcd(A[i], A[j]) > 1 {
                    var m1 = map[A[i], default: [Int]()]
                    m1.append(A[j])
                    map[A[i]] = m1

                    var m2 = map[A[j], default: [Int]()]
                    m2.append(A[i])
                    map[A[j]] = m2
                }
            }
        }

        print("\(map)")

        var maxLen = 0

        func dfs(from start: Int, _ visited: inout Set<Int>) {
            if visited.count > maxLen {
                maxLen = visited.count
            }
            let candidate = map[start, default: [Int]()]
            for next in candidate {
                if visited.contains(next) == false {
                    visited.insert(next)
                    dfs(from: next, &visited)
                    visited.remove(next)
                }
            }
        }

        for start in A {
            var visited: Set<Int> = [start]
            dfs(from: start, &visited)
        }

        return maxLen
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        return gcd(b, a % b)
    }
}