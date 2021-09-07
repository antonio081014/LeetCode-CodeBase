/**
 * https://leetcode.com/problems/slowest-key/
 * 
 * 
 */ 
// Date: Mon Sep  6 18:19:08 PDT 2021
class Solution {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        var longest = 0
        var result = Character("a")
        var last = 0
        let keys = Array(keysPressed)
        for index in 0 ..< releaseTimes.count {
            let duration = releaseTimes[index] - last
            last = releaseTimes[index]
            if duration > longest {
                longest = duration
                result = keys[index]
            } else if duration == longest {
                result = max(result, keys[index])
            }
        }
        return result
    }
}