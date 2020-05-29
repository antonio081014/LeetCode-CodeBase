/**
 * https://leetcode.com/problems/course-schedule/
 * 
 * 
 */ 
// Date: Fri May 29 11:28:24 PDT 2020
class Solution {
    /// Check if there s a cycle in this graph.
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph: [[Int]] = Array(repeating: [], count: numCourses)
        for item in prerequisites {
            graph[item[0]].append(item[1])
        }
        
        func dfs(_ course: Int, _ visited: inout Set<Int>) -> Bool {
            if visited.contains(course) { return false }
            visited.insert(course)
            for preq in graph[course] {
                if dfs(preq, &visited) == false {
                    return false
                }
            }
            visited.remove(course)
            return true
        }
        
        for course in 0 ..< numCourses {
            var visited: Set<Int> = []
            if dfs(course, &visited) == false { return false }
        }
        return true
    }
}
