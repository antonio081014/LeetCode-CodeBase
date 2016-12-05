/**
 * Problem Link: https://leetcode.com/problems/merge-intervals/
 * 
 * Definition for an interval.
 * public class Interval {
 *     int start;
 *     int end;
 *     Interval() { start = 0; end = 0; }
 *     Interval(int s, int e) { start = s; end = e; }
 * }
 */
public class Solution {
    public List<Interval> merge(List<Interval> intervals) {
        if(intervals == null || intervals.size() <= 1) return intervals;
        
        List<Interval> result = new ArrayList<Interval>();
        Collections.sort(intervals, new Comparator<Interval>(){
            public int compare(Interval s1,Interval s2){
                return s1.start - s2.start;
            }
        });
        
        Interval prev = intervals.get(0);
        for(int i=1; i<intervals.size(); i++) {
            Interval v = intervals.get(i);
            if(v.start <= prev.end) {
                // merge;
                Interval x = new Interval(prev.start, Math.max(v.end, prev.end));
                prev = x;
            } else {
                result.add(prev);
                prev = v;
            }
        }
        result.add(prev);
        
        return result;
    }
}
