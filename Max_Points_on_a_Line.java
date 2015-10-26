/**
 * Problem Link: https://leetcode.com/problems/max-points-on-a-line/
 * 
 * Definition for a point.
 * class Point {
 *     int x;
 *     int y;
 *     Point() { x = 0; y = 0; }
 *     Point(int a, int b) { x = a; y = b; }
 * }
 */
public class Solution {
    public int maxPoints(Point[] points) {
        int max = 0;
        for(int i=0; i<points.length; i++) {
            int duplicate = 1;
            int verticle = 0;
            HashMap<Double, Integer> map = new HashMap<Double, Integer>();
            for(int j=i+1; j<points.length; j++) {
                if(points[i].x == points[j].x) {
                    if(points[i].y == points[j].y) duplicate ++;
                    else verticle ++;
                    max = Math.max(max, duplicate + verticle);
                } else {
                    double slope = points[i].y == points[j].y ? 0.0 : 1.0 * (points[j].y - points[i].y) / (points[j].x - points[i].x);
                    if(map.get(slope) == null) {
                        map.put(slope, 1);
                    } else {
                        map.put(slope, map.get(slope) + 1);
                    }
                    max = Math.max(max, duplicate + map.get(slope));
                }
            }
            max = Math.max(max, duplicate + verticle);
            for(Integer cnt : map.values()){
                max = Math.max(max, duplicate + cnt);
            } 
        }
        return max;
    }
}
