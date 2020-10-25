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
}/**
 * https://leetcode.com/problems/stone-game-iv/
 * 
 * 
 */ 
// Date: Sun Oct 25 11:30:51 PDT 2020
class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var result = Array(repeating: false, count: n + 1)
        let candidate = (1 ... n).compactMap { num -> Int? in 
                                       if num * num <= n { return num * num }
                                       return nil
                                      }
        // print(candidate)
        for x in 0 ... n {
            if result[x] { continue }
            for step in candidate {
                if x + step > n { break }
                result[x + step] = true
            }
        }
        return result[n]
    }
}/**
 * https://leetcode.com/problems/stone-game-iv/
 * 
 * 
 */ 
// Date: Sun Oct 25 11:32:44 PDT 2020
class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var result = Array(repeating: false, count: n + 1)
        // print(candidate)
        for x in 0 ... n {
            if result[x] { continue }
            var step = 1
            while x + step * step <= n {
                result[x + step * step] = true
                step += 1
            }
        }
        return result[n]
    }
}