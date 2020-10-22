/**
 * https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/
 * 
 * 
 */ 
// Date: Thu Oct 22 11:48:16 PDT 2020
class Solution {
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        var count: [Int : Int] = [:]
        for index in 0 ..< A.count {
            count[A[index]] = 1 + count[A[index], default: 0]
            if A[index] != B[index] {
                count[B[index]] = 1 + count[B[index], default: 0]
            }
        }
        if let filteredOne = count.filter {$0.value == A.count }.first {
            var times1 = 0
            var times2 = 0
            // print(filteredOne)
            for index in 0 ..< A.count {
                if A[index] != filteredOne.key { times1 += 1 }
                if B[index] != filteredOne.key { times2 += 1 }
            }
            return min(times1, times2)
        } 
        return -1
    }
}

