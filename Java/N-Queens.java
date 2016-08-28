public class Solution {
    private List<List<String>> ret;
    public List<List<String>> solveNQueens(int n) {
        ret = new ArrayList<List<String>>();
        char[][] puzzle = new char[n][n];
        for(int i=0; i<n; i++) for(int j=0; j<n; j++) puzzle[i][j] = '.';
        backtrack(puzzle, 0, n);
        return ret;
    }
    
    private void backtrack(char[][] puzzle, int k, int n) {
        if (is_a_solution(k, n)) {
            ret.add(process_solution(puzzle, n));
            return;
        }
        
        String candidate = constructCandidate(puzzle, k, n);
        for(int i=0; i<candidate.length(); i++) {
            if(candidate.charAt(i) == 'Q') {
                puzzle[k][i] = 'Q';
                backtrack(puzzle, k+1, n);
                puzzle[k][i] = '.';
            }
        }
    }
    
    private String constructCandidate(char[][] puzzle, int k, int n) {
        String s = "";
        for(int i=0; i<n; i++) {
            if(validPosition(puzzle, k, i, n))  s += "Q";
            else s += ".";
        }
        return s;
    }
    
    private boolean validPosition(char[][] puzzle, int i, int j, int n) {
        for(int k=0; k<n; k++) if(k!=i && puzzle[k][j] == 'Q') return false;
        for(int a=i-1,b=j-1; a>=0 && b>=0; a--,b--) if(puzzle[a][b] == 'Q') return false;
        for(int a=i+1,b=j+1; a<n && b<n; a++,b++) if(puzzle[a][b] == 'Q') return false;
        for(int a=i-1,b=j+1; a>=0 && b<n; a--,b++) if(puzzle[a][b] == 'Q') return false;
        for(int a=i+1,b=j-1; a<n && b>=0; a++,b--) if(puzzle[a][b] == 'Q') return false;
        return true;
    }
    
    private boolean is_a_solution(int k, int n) {
        return k == n;
    }
    
    private List<String> process_solution(char[][] puzzle, int n) {
        List<String> list = new ArrayList<String>();
        for(int i=0; i<n; i++) {
            String s = "";
            for(int j=0; j<n; j++) {
                s+=puzzle[i][j];
            }
            list.add(s);
        }
        return list;
    }
}
