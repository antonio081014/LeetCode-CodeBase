public class Solution {
    public double myPow(double x, int n) {
        if(n < 0) return 1.0 / pow(x, -n);
        return pow(x, n);
    }
    
    private double pow(double x, int n) {
        if (x == 0) return 0;
        if (n == 0) return 1;
        if (n == 1) return x;
        
        double value = myPow(x, n/2);
        
        if(n % 2 == 0) return value * value;
        else return x * value * value;
    }
}
