/**
 * https://leetcode.com/problems/course-schedule-ii/
 * 
 * 
 */ 
// Date: Mon Jun  8 16:03:47 PDT 2020
class Solution {
    /// Topological sort.
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph: [[Int]] = Array(repeating: [], count: numCourses)
        var degree = Array(repeating: 0, count: numCourses)
        for item in prerequisites {
            graph[item[1]].append(item[0])
            degree[item[0]] += 1
        }
        var visitedQ: [Int] = []
        for index in 0 ..< numCourses {
            if degree[index] == 0 {
                visitedQ.append(index)
            }
        }
        var children: [[Int]] = Array(repeating: [], count: numCourses)
        
        var path: [Int] = []
        while visitedQ.isEmpty == false {
            let preCourse = visitedQ.removeFirst()
            path.append(preCourse)
            for course in graph[preCourse] {
                degree[course] -= 1
                if degree[course] == 0 {
                    visitedQ.append(course)
                }
            }
        }
        return path.count == numCourses ? path : []
    }
}
