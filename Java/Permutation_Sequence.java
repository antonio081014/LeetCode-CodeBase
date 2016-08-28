public class Solution {
    public String getPermutation(int n, int k) {
        int[] nums = new int[n];
        for(int i=0; i<n; i++) nums[i] = i+1;
        for(int i=1; i<k; i++) {
            nextPermutation(nums);
        }
        String s = "";
        for(int i=0; i<n ;i++)
        s += nums[i];
        return s;
    }
    
    public void nextPermutation(int[] array) {
        int i, j;
        // Find the largest index k such that a[k] < a[k + 1]. If no such index
        // exists, the permutation is the last permutation.
        for (i = array.length - 2; i >= 0; i--) {
            if (array[i] < array[i + 1])
                break;
        }
        if (i < 0) {
            // System.out.println("End");
            Arrays.sort(array);
            return;
        }
        
        // Find the largest index l such that a[k] < a[l]. Since k + 1 is such
        // an index, l is well defined and satisfies k < l.
        for (j = array.length - 1; j > i; j--) {
            if (array[j] > array[i])
                break;
        }
        
        // Swap a[k] with a[l].
        swap(array, i++, j);
        
        // Reverse the sequence from a[k + 1] up to and including the final
        // element a[n].
        for (j = array.length - 1; j > i; i++, j--) {
            swap(array, i, j);
        }
    }
    
    public void swap(int[] array, int x, int y) {
        array[x] ^= array[y];
        array[y] ^= array[x];
        array[x] ^= array[y];
    }
}
