/**
 * https://leetcode.com/problems/keys-and-rooms/
 * 
 * 
 */ 
// Date: Fri Mar 19 09:28:49 PDT 2021
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited: Set<Int> = [0]
        var queue = [0]
        while queue.isEmpty == false {
            let room = queue.removeFirst()
            for accessRoom in rooms[room] {
                if visited.contains(accessRoom) == false {
                    queue.append(accessRoom)
                    visited.insert(accessRoom)
                }
            }
        }
        return visited.count == rooms.count
    }
}