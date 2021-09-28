/**
 * https://leetcode.com/problems/unique-email-addresses/
 * 
 * 
 */ 
// Date: Mon Sep 27 22:08:24 PDT 2021
class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var set: Set<String> = []
        for email in emails {
            set.insert(proc(email))
        }
        return set.count
    }
    
    private func proc(_ email: String) -> String {
        var result = [Character]()
        var isLocal = true
        var ignore = false
        for c in email {
            if isLocal == false {
                result.append(c)
            } else {
                if c == Character(".") { continue }
                if c == Character("+") {
                    ignore = true
                    continue
                }
                if c == Character("@") {
                    isLocal = false
                    result.append(c)
                    continue
                }
                if ignore == false {
                    result.append(c)
                }
            }
        }
        return String(result)
    }
}