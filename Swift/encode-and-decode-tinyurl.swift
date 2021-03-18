/**
 * https://leetcode.com/problems/encode-and-decode-tinyurl/
 * 
 * 
 */ 
// Date: Mon Mar 15 07:04:58 PDT 2021
class Codec {
    
    var hashing: [Int : String] = [:]
    
    // Encodes a URL to a shortened URL.
    func encode(_ longUrl: String) -> String {
        let hash = longUrl.hash
        self.hashing[hash] = longUrl
        return "http://tinyurl.com/\(longUrl.hash)"
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        guard let hashString = shortUrl.components(separatedBy: "/").last, 
        let hash = Int(hashString), 
        let url = self.hashing[hash] else { return "" }
        return url
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(longUrl)
 * let ans = obj.decode(s)
*/