/**
 * Problem Link: https://leetcode.com/problems/simplify-path/
 *
 * Using stack to implement the path simplify process.
 */

class Solution {
    func simplifyPath(_ path: String) -> String {
        let comp = path.characters.split(separator: "/").map(String.init)
        var ret = [String]()
        for path in comp {
            if path.characters.count == 0 {
                continue
            }
            if path == "." {
                continue
            }
            if path == ".." {
                let _ = ret.popLast()
            } else {
                ret.append(path)
            }
        }
        return "/" + ret.joined(separator: "/")
    }
}
