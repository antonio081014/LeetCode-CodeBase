/**
 * https://leetcode.com/problems/asteroid-collision/
 * 
 * 
 */ 
// Date: Thu Oct 22 10:23:41 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is asteroids.count.
    ///     - Space: O(n), n is asteroids.count.
    ///
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []
        for asteroid in asteroids {
            var exploded = false
            while let last = stack.last, !exploded {
                if last > 0, asteroid < 0 {
                    if last + asteroid < 0 {
                        stack.removeLast()
                    } else if last + asteroid == 0 {
                        exploded = true
                        stack.removeLast()
                        break
                    } else { exploded = true }
                } else {
                    break
                }
            }
            if !exploded {
                stack.append(asteroid)
            } 
        }
        return stack
    }
}

