/**
 * https://leetcode.com/problems/guess-number-higher-or-lower/
 * 
 * 
 */ 
/** 
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if the picked number is lower than your guess number
 *			      1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int 
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            let mid = left + (right - left) / 2
            let g = guess(mid)
            if g == 0 {
                return mid
            } else if g == -1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return 0
    }
}/**
 * https://leetcode.com/problems/guess-number-higher-or-lower/
 * 
 * 
 */ 
// Date: Mon Oct 11 18:20:50 PDT 2021
/** 
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if the picked number is lower than your guess number
 *			      1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int 
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            let mid1 = left + (right - left) / 3
            let mid2 = right - (right - left) / 3
            let g1 = guess(mid1)
            let g2 = guess(mid2)
            if g1 == 0 {
                return mid1
            }
            if g2 == 0 {
                return mid2
            }
            if g1 == -1 {
                right = mid1 - 1
            } else if g2 == 1 {
                left = mid2 + 1
            } else {
                left = mid1 + 1
                right = mid2 - 1
            }
        }
        return -1
    }
}