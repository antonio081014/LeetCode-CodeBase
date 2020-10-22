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

/**
 * https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/
 * 
 * 
 */ 
// Date: Thu Oct 22 11:53:07 PDT 2020
class Solution {
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        var count1 = Array(repeating: 0, count: 7)
        var count2 = Array(repeating: 0, count: 7)
        var same = Array(repeating: 0, count: 7)
        for index in 0 ..< A.count {
            count1[A[index]] += 1
            count2[B[index]] += 1
            if A[index] == B[index] {
                same[A[index]] += 1
            }
        }
        for n in 1 ... 6 {
            if count1[n] + count2[n] - same[n] == A.count {
                return A.count - max(count1[n], count2[n])
            }
        }
        return -1
    }
}

