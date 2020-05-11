/**
 * https://leetcode.com/problems/flood-fill/
 * 
 * 
 */ 
// Date: Mon May 11 09:12:02 PDT 2020
class Solution {
    /// BFS
    /// - Complexity:
    ///     - Time: O(m * n), m and n are the size of image.
    ///     - Space: O(m * n), m and n are the size of image.
    ///
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let n = image.count
        guard let m = image.first?.count else { return [] }
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var map = image
        var queue = [(sr, sc)]
        map[sr][sc] = newColor
        visited[sr][sc] = true
        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            for index in 0 ..< dx.count {
                let rr = r + dx[index]
                let cc = c + dy[index]
                if rr >= 0, rr < n, cc >= 0, cc < m, image[r][c] == image[rr][cc], !visited[rr][cc] {
                    map[rr][cc] = newColor
                    queue.append((rr, cc))
                    visited[rr][cc] = true
                }
            }
        }
        return map
    }
}
