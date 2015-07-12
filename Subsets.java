public class Solution {
    private List<List<Integer>> list;
    public List<List<Integer>> subsets(int[] nums) {
        Arrays.sort(nums);
        list = new ArrayList<List<Integer>>();
        subset(nums);
        return list;
    }
    
    public void subset(int[] s) {
        int[] a = new int[s.length];
        backtrack(a, 0, s);
    }
    
    /*
     * The first k-1 indices is stored in a, here we need to choose the kth
     * element;
     */
    public void backtrack(int[] a, int k, int[] s) {
        // if we reach the end;
        if (is_a_solution(a, k, s)) {
            process_solution(a, k, s);
            return;
        }
        
        int[] candidates = construct_candidates(a, k, s);
        // k = k + 1;
        for (int i = 0; i < candidates.length; i++) {
            a[k] = candidates[i];
            backtrack(a, k + 1, s);
        }
    }
    
    public int[] construct_candidates(int[] a, int k, int[] s) {
        // Only two possibility exists;
        int[] ret = { 0, 1 };
        return ret;
    }
    
    /*
     * Process the permutation, which is the array of the indices;
     */
    public void process_solution(int[] a, int k, int[] s) {
        List<Integer> num = new ArrayList<Integer>();
        for (int i = 0; i < s.length; i++) {
            if (a[i] == 1) {
                num.add(s[i]);
            }
        }
        // Collections.sort(num);
        this.list.add(num);
    }
    
    public boolean is_a_solution(int[] a, int k, int[] s) {
        // Reach the limit, which there is no element here;
        int n = s.length;
        return k == n;
    }
}
