/**
 * https://leetcode.com/problems/validate-ip-address/
 * 
 * 
 */ 
import Foundation
class Solution {
    func validIPAddress(_ IP: String) -> String {
        if validIPAddressV4(IP) {return "IPv4"}
        if validIPAddressV6(IP) {return "IPv6"}
        return "Neither"
    }
    
    private func validIPAddressV4(_ ip: String) -> Bool {
        if !ip.contains(".") {return false}
        
//        var characterSet = CharacterSet()
//        characterSet.formUnion(CharacterSet.decimalDigits)
//        characterSet.insert(charactersIn: ".")
//        characterSet.invert()
//        if ip.rangeOfCharacter(from: characterSet) != nil { return false }
        
        if !inRange(ip, in: "0123456789.") { return false }
        
        let nums = ip.components(separatedBy:".")
        if nums.count != 4 {return false}
        for num in nums {
            let len = num.characters.count
            if len<1 || len>4 {return false}
            if len>1, String(num[num.startIndex]) == "0" {return false}
            if let x = Int(num), x>=0, x<256 {continue}
            return false
        }
        return true
    }
    
    private func validIPAddressV6(_ ip: String) -> Bool {
        if !ip.contains(":") {return false}
        
//        var characterSet = CharacterSet()
//        characterSet.formUnion(CharacterSet.decimalDigits)
//        characterSet.insert(charactersIn: ":ABCDEFabcdef")
//        characterSet.invert()
//        if ip.rangeOfCharacter(from: characterSet) != nil { return false }
        
        if !inRange(ip, in: "0123456789:ABCDEFabcdef") { return false }
        
        let nums = ip.components(separatedBy:":")
        if nums.count != 8 {return false}
        for num in nums {
            let len = num.characters.count
            if len<1 || len>4 {return false}
            if let x = UInt(num, radix:16), x<=UInt(0xFFFF) { continue }
            return false
        }
        return true
    }
    
    private func inRange(_ text: String, in range: String) -> Bool {
        for c in text.characters {
            if !range.contains(String(c)) {
                return false
            }
        }
        return true
    }
}

let solution = Solution()
print("\(solution.validIPAddress("0.0.0.-0"))")
print("\(solution.validIPAddress("172.16.254.1"))")
print("\(solution.validIPAddress("2001:db8:85a3:0:0:8A2E:370:7334"))")
/**
 * https://leetcode.com/problems/validate-ip-address/
 * 
 * 
 */ 
// Date: Tue Jun 16 15:48:44 PDT 2020
class Solution {
    func validIPAddress(_ IP: String) -> String {
        if IP.contains("."), self.checkIPv4(IP) {
            return "IPv4"
        } else if self.checkIPv6(IP) {
            return "IPv6"
        }
        return "Neither"
    }
    
    private func checkIPv4(_ address: String) -> Bool {
        let comp = address.split(separator: ".", omittingEmptySubsequences: false)
        if comp.count != 4 { return false }
        for num in comp {
            if num.count == 0 { return false }
            if num.count > 3 { return false }
            if let x = Int(num), (x >= 0 && x < 256) {
                if String(x) != num { return false }
                continue
            }
            else { return false }
            
        }
        return true
    }
    
    private func checkIPv6(_ address: String) -> Bool {
        if address.contains("-") { return false }
        let comp = address.split(separator: ":", omittingEmptySubsequences: false)
        if comp.count != 8 { return false }
        for num in comp {
            // print("\(num) : \(num.count)")
            if num.count == 0 { return false }
            if num.count > 4 { return false }
            if let x = Int(num, radix: 16), (x >= 0 && x < 0xFFFF) {
                // print("\(x)")
                // if String(x, radix: 16, uppercase: false) != num { return false }
                continue
            } else { return false }
        }
        return true
    }
}
