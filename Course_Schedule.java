/**
 * Problem: https://leetcode.com/problems/course-schedule/
 * 
 * Detecting Graph Cycle using DFS.
 */

public class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        HashMap<Integer,ArrayList<Integer>> map = new HashMap<Integer,ArrayList<Integer>>();
        for(int[] a: prerequisites){
            if(map.containsKey(a[1])){
                map.get(a[1]).add(a[0]);
            }else{
                ArrayList<Integer> l = new ArrayList<Integer>();
                l.add(a[0]);
                map.put(a[1], l);
            }
        }
        int[] visited = new int[numCourses];
        for(int i=0; i<numCourses; i++) {
            if(hasCycle(i, numCourses, map, visited)) return false;
        }
        return true;
    }
    
    private boolean hasCycle(int start, int n, HashMap<Integer,ArrayList<Integer>> map, int[] visited) {
        if(visited[start] == -1) return true;
        if(visited[start] == 1) return false;
        visited[start] = -1;
        if(map.containsKey(start)){
            for(int x : map.get(start)) {
                if(hasCycle(x, n, map, visited)) {
                    return true;
                }
            }
        }
        visited[start] = 1;
        return false;
    }
}
