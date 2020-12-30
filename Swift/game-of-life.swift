/**
 * https://leetcode.com/problems/game-of-life/
 * 
 * 
 */ 
// Date: Wed Dec 30 09:10:03 PST 2020
class Solution {
	
	func gameOfLife(_ board: inout [[Int]]) {
		
		guard board.count > 0 else { return }
		guard board[0].count > 0 else { return }
		
		for i in 0..<board.count {
			for j in 0..<board[0].count {
				
				// cell is dead
				if board[i][j] == 0 {
					if getLivesCount(board, i, j) == 3 {
						board[i][j] = 3 // dead -> alive
					}
				}
				
				// cell is alive
				if board[i][j] == 1 {
					if getLivesCount(board, i, j) < 2 || getLivesCount(board, i, j) > 3 {
						board[i][j] = 2 // alive -> dead
					}
				}
			}
		}
		
		for i in 0..<board.count {
			for j in 0..<board[0].count {
				board[i][j] %= 2
			}
		}
	}
	
	private func getLivesCount(_ board: [[Int]], _ i: Int, _ j: Int) -> Int {
		let dimensions: [[Int]] = [
			[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
		var lives = 0
		
		for d in dimensions {
			let x = d[0] + i
			let y = d[1] + j
			guard x >= 0, x < board.count, y >= 0, y < board[0].count else {
				continue
			}
			if board[x][y] == 1 || board[x][y] == 2 {
				lives += 1
			}
		}
		return lives
	}
}