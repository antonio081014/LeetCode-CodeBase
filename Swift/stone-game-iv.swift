/**
 * https://leetcode.com/problems/stone-game-iv/
 * 
 * 
 */ 
// Date: Sun Oct 25 11:27:07 PDT 2020
class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var result = Array(repeating: false, count: n + 1)
        let candidate = (1 ... n).compactMap { num -> Int? in 
                                       if num * num <= n { return num * num }
                                       return nil
                                      }
        // print(candidate)
        for x in 1 ... n {
            for step in candidate {
                if x < step { break }
                if result[x - step] == false {
                    result[x] = true
                    break
                }
            }
        }
        return result[n]
    }
}