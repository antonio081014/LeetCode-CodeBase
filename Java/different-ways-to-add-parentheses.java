public class Solution {
    public List<Integer> diffWaysToCompute(String input) {
        List<Integer> list = new ArrayList<Integer>();
        for(int i=1; i+1<input.length(); i++) {
            if(input.charAt(i) == '+' || input.charAt(i) == '-' || input.charAt(i) == '*') {
                List<Integer> a = diffWaysToCompute(input.substring(0, i));
                List<Integer> b = diffWaysToCompute(input.substring(i+1));
                for(Integer x : a) {
                    for(Integer y : b) {
                        if(input.charAt(i) == '+') {
                            list.add(x + y);
                        } else if (input.charAt(i) == '-'){
                            list.add(x - y);
                        } else if (input.charAt(i) == '*'){
                            list.add(x * y);
                        }
                    }
                }
            }
        }
        if(list.size() == 0) {
            int a = Integer.parseInt(input);
            list.add(a);
        }
        return list;
    }
}
