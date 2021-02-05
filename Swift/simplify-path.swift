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
/**
 * https://leetcode.com/problems/simplify-path/
 * 
 * 
 */ 
// Date: Fri Feb  5 09:31:47 PST 2021
class Solution {
    func simplifyPath(_ path: String) -> String {
        let list = path.components(separatedBy: "/")
        var result: [String] = []
        for p in list {
            if p.count > 0 {
                if p == ".." {
                    if result.isEmpty == false {
                        result.removeLast()
                    }
                } else if p == "." {
                    continue
                } else {
                    result.append(p)
                }
            }
        }
        return "/" + result.joined(separator: "/")
    }
}/**
 * https://leetcode.com/problems/simplify-path/
 * 
 * 
 */ 
// Date: Fri Feb  5 09:41:26 PST 2021
class Solution {
    func simplifyPath(_ path: String) -> String {
        var text = ""
        var result : [String] = []
        for c in path + "/" {
            let cString = String(c)
            if c == "/" {
                if text.count > 0 {
                    if text == "." {
                        // do nothing
                    } else if text == ".." {
                        if result.isEmpty == false {
                            result.removeLast()
                        }
                    } else {
                        result.append(text)
                    }
                    text = ""
                }
            } else {
                text.append(c)
            }
        }
        return "/" + result.joined(separator: "/")
    }
}