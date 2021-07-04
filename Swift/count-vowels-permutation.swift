/**
 * https://leetcode.com/problems/count-vowels-permutation/
 * 
 * 
 */ 
// Date: Sun Jul  4 08:55:22 PDT 2021
class Solution {
    func countVowelPermutation(_ n: Int) -> Int {
        // a, e, i, o, u
        let mod = 1000000007
        var count = Array(repeating: Array(repeating: 0, count: 5), count: n)
        for index in 0 ..< n {
            for v in 0 ..< 5 {
                if index == 0 {
                    count[index][v] = 1
                } else {
                    switch v {
                        case 0:
                        count[index][v] += (((count[index - 1][1] + count[index - 1][2]) % mod) + count[index - 1][4]) % mod
                        case 1:
                        count[index][v] += (count[index - 1][0] + count[index - 1][2]) % mod
                        case 2:
                        count[index][v] += (count[index - 1][1] + count[index - 1][3]) % mod
                        case 3:
                        count[index][v] += (count[index - 1][2]) % mod
                        case 4:
                        count[index][v] += (count[index - 1][2] + count[index - 1][3]) % mod
                        default: break
                    }
                }
            }
        }
        var result = 0
        for v in 0 ..< 5 {
            result = (result + count[n - 1][v]) % mod
        }
        return result
    }
}