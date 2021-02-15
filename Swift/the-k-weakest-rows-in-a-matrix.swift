/**
 * https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
 * 
 * 
 */ 
// Date: Mon Feb 15 15:37:07 PST 2021
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let n = mat.count
        guard let m = mat.first?.count else { return [] }
        var count: [Int : Int] = [:]
        for i in 0 ..< n {
            for j in 0 ..< m {
                count[i, default: 0] += mat[i][j]
            }
        }
        let list = count.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }.map { $0.0 }
        return Array(list[0 ..< k])
    }
}

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let n = mat.count
        guard let m = mat.first?.count else { return [] }
        var count: [Int : Int] = [:]
        for i in 0 ..< n {
            var left = 0
            var right = m
            while left < right {
                let mid = left + (right - left) / 2
                if mat[i][mid] == 1 {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            count[i] = left
        }
        let list = count.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }.map { $0.0 }
        return Array(list[0 ..< k])
    }
}