/**
 * Problem Link: https://leetcode.com/problems/jump-game-ii/
 * 
 * 1st, Using DFS, stack overflow.
 * 2nd, Using BFS, timeout.
 * 3rd, Using Greedy, Fancy.
 */
class Node implements Comparable<Node>{
    public int index;
    public int step;
    
    public Node(int idx, int s) {
        index = idx;
        step = s;
    }
    
    public int compareTo(Node n) {
        return this.step - n.step;
    }
}
public class Solution {
    public int jump(int[] nums) {
        int ret = 0;
        int last = 0;
        int curr = 0;
        for (int i = 0; i < nums.length; ++i) {
            if (i > last) {
                last = curr;
                ++ret;
            }
            curr = Math.max(curr, i+nums[i]);
        }

        return ret;
    }
    public int jump_BFS(int[] nums) {
        int n = nums.length;
        boolean[] count = new boolean[n];
        
        PriorityQueue<Node> q = new PriorityQueue<Node>();
        q.add(new Node(0, 0));
        
        while(!q.isEmpty()) {
            Node x = q.poll();
            if(count[x.index]) continue;
            count[x.index] = true;
            int cost = x.step + 1;
            if(x.index == n - 1) return x.step;
            for(int c = nums[x.index]; c>=1; c--) {
                int prev = x.index - c;
                int next = x.index + c;
                if(prev >= 0 && !count[prev]) {
                    q.add(new Node(prev, cost));
                }
                if(next < nums.length && !count[next]) {
                    q.add(new Node(next, cost));
                }
            }
        }
        return -1;
    }
    
    private void jump(int[] nums, int[] count, int current) {
        if(current == nums.length - 1) return;
        for(int i=nums[current]; i>=1; i--) {
            int prev = current - i;
            int next = current + i;
            int cost = count[current] + 1;
            if(prev >= 0) {
                if(count[prev] == -1 || count[prev] > cost) {
                    count[prev] = cost;
                    jump(nums, count, prev);
                }
            }
            if(next < nums.length) {
                if(count[next] == -1 || count[next] > cost) {
                    count[next] = cost;
                    jump(nums, count, next);
                }
            }
        }
    }
}
