/*
 Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).

  

 Example 1:

 Input: s = "aa", p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input: s = "aa", p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 Example 3:

 Input: s = "ab", p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
  

 Constraints:

 1 <= s.length <= 20
 1 <= p.length <= 30
 s contains only lowercase English letters.
 p contains only lowercase English letters, '.', and '*'.
 It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.
 */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s)
        let p = Array(p)
        
        var memo = [String: Bool]()
        
        func dp(_ i: Int, _ j: Int) -> Bool {
            if j == p.count {
                return i == s.count
            }
            
            if i == s.count {
                if (p.count - j) % 2 == 1 {
                    return false
                }
                
                var j = j
                
                while j < p.count - 1 {
                    if p[j + 1] != "*" {
                        return false
                    }
                    j += 2
                }
                
                return true
            }
            
            let key = "\(i)-\(j)"
            if let cached = memo[key] {
                return cached
            }
            
            var isMatched = false
            
            if s[i] == p[j] || p[j] == "." {
                if j + 1 < p.count && p[j + 1] == "*" {
                    isMatched = dp(i, j + 2) || dp(i + 1, j)
                } else {
                    isMatched = dp(i + 1, j + 1)
                }
            } else {
                if j + 1 < p.count && p[j + 1] == "*" {
                    isMatched = dp(i, j + 2)
                } else {
                    isMatched = false
                }
            }
            
            memo[key] = isMatched
            
            return isMatched
        }
        
        return dp(0, 0)
    }
}
