/**
 * https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/
 * 
 * 
 */ 
// Date: Mon Sep 20 22:39:15 PDT 2021
class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        var rows = [0, 0, 0]
        var cols = [0, 0, 0]
        var x1 = 0
        var x2 = 0
        
        for index in 0 ..< moves.count {
            let x = moves[index][0]
            let y = moves[index][1]
            rows[x] += index % 2 == 0 ? 1 : -1
            cols[y] += index % 2 == 0 ? 1 : -1
            if x + y == 2 {
                x1 += index % 2 == 0 ? 1 : -1
            }
            if x == y {
                x2 += index % 2 == 0 ? 1 : -1
            }
        }
        
        if rows.filter{ $0 == 3 }.count > 0 
        || cols.filter{ $0 == 3 }.count > 0
        || x1 == 3
        || x2 == 3 { return "A" }
        
        if rows.filter{ $0 == -3 }.count > 0 
        || cols.filter{ $0 == -3 }.count > 0
        || x1 == -3
        || x2 == -3 { return "B" }
        
        if moves.count == 9 { return "Draw" }
        return "Pending"
    }
}