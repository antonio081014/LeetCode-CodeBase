/**
 * https://leetcode.com/problems/find-duplicate-file-in-system/
 * 
 * 
 */ 
// Date: Tue May 18 14:06:06 PDT 2021
class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var dict = [String : [String]]()
        for path in paths {
            let fileList = pathToFile(path)
            for (path, content) in fileList {
                dict[content, default: []].append(path)
            }
        }
        var result = [[String]]()
        for value in dict.values {
            if value.count > 1 {
                result.append(value)
            }
        }
        return result
    }

    private func pathToFile(_ filePath: String) -> [(path: String, content: String)] {
        var result = [(String, String)]()
        let components = filePath.components(separatedBy: " ")
        let root = components.first!
        for index in 1 ..< components.count {
            let text = components[index].components(separatedBy: "(")
            let path = root + "/" + text[0]
            let content = String(text[1].dropLast())
            result.append((path: path, content: content))
        }
        return result
    }
}