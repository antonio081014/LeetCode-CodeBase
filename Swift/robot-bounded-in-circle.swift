/**
 * https://leetcode.com/problems/robot-bounded-in-circle/
 * 
 * 
 */ 
// Date: Thu Sep 17 09:57:55 PDT 2020
/**
Let chopper help explain.

Starting at the origin and face north (0,1),
after one sequence of instructions,

if chopper return to the origin, he is obvious in an circle.
if chopper finishes with face not towards north,
it will get back to the initial status in another one or three sequences.

*/
class Solution {
    /// - Complexity:
    ///     - Time: O(N)
    ///     - Space: O(1)
    func isRobotBounded(_ instructions: String) -> Bool {
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        
        var x = 0
        var y = 0
        var dir = 0
        for c in instructions {
            let s = String(c)
            if s == "R" {
                dir = (dir + 1) % 4
            } else if s == "L" {
                dir = (dir + 3) % 4
            } else {
                x += dx[dir]
                y += dy[dir]
            }
        }
        
        return x == 0 && y == 0 || dir > 0
    }
}