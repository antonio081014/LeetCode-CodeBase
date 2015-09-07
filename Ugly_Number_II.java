public class Solution {
    public int nthUglyNumber(int n) {
        int x = 0;
        int y = 0;
        int z = 0;
        int[] result = new int[n];
        result[0] = 1;
        
        for(int i=1; i<n; i++) {
            int min = minOf(result[x] * 2, result[y] * 3, result[z] * 5);
            if(min == result[x] * 2) x++;
            if(min == result[y] * 3) y++;
            if(min == result[z] * 5) z++;
            result[i] = min;
        }
        return result[n-1];
    }
    
    private int minOf(int a, int b, int c) {
        int temp = a < b ? a : b;
        return temp < c ? temp : c; 
    }
}
