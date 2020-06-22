/**
 * https://leetcode.com/problems/dungeon-game/
 * 
 * 
 */ 
// Date: Sun Jun 21 22:13:33 PDT 2020
class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let n = dungeon.count
        guard let m = dungeon.first?.count else { return 0 }
        // minimum required health points to reach (x, y)
        // after costing certain points, it should be at least 1.
        var minHealth = Array(repeating: Array(repeating: 0, count: m), count: n)
        minHealth[n - 1][m - 1] = max(1, 1 - dungeon[n - 1][m - 1])
        
        for x in stride(from: n - 2, through: 0, by: -1) {
            minHealth[x][m - 1] = max(1, minHealth[x + 1][m - 1] - dungeon[x][m - 1])
        }
        for y in stride(from: m - 2, through: 0, by: -1) {
            minHealth[n - 1][y] = max(1, minHealth[n - 1][y + 1] - dungeon[n - 1][y])
        }
        
        for x in stride(from: n - 2, through: 0, by: -1) {
            for y in stride(from: m - 2, through: 0, by: -1) {
                let cost = min(minHealth[x + 1][y], minHealth[x][y + 1]) - dungeon[x][y]
                minHealth[x][y] = max(1, cost)
            }
        }
        // print("\(minHealth)")
        return minHealth[0][0]
    }
}