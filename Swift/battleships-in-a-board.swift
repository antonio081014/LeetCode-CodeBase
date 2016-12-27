/**
 * https://leetcode.com/problems/battleships-in-a-board/
 * 
 * 
 */ 
class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        let n = board.count
        guard n > 0 else { return 0}
        let m = board[0].count
        var count = 0
        for i in 0..<n {
            for j in 0..<m {
                if String(board[i][j]) == "." {continue}
                if i>0, String(board[i-1][j])=="X" {continue}
                if j>0, String(board[i][j-1])=="X" {continue}
                count += 1
            }
        }
        return count
    }
}
