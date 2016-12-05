public class Solution {
    public String multiply(String num1, String num2) {
        int len1 = num1.length();
        int len2 = num2.length();
        int[] sum = new int[len1 + len2];
        for(int i=0; i<len1; i++) {
            for(int j=0; j<len2; j++) {
                int a = (int)(num1.charAt(len1-i-1) - '0');
                int b = (int)(num2.charAt(len2-j-1) - '0');
                sum[i+j] += a * b;
            }
        }
        
        String s = "";
        int carry = 0;
        for(int i=0; i<len1 + len2; i++) {
            sum[i] += carry;
            carry = sum[i] / 10;
            sum[i] %= 10;
            s = "" + sum[i] + s;
        }
        // System.out.println(s);
        if(carry > 0) s = "" + carry + s;
        for(int i=0; i+1<s.length();) {
            if(s.charAt(i) == '0') s = s.substring(i+1);
            else break;
        }
        return s;
    }
}
