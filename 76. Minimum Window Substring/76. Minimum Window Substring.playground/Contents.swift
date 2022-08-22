/*
 Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

 The testcases will be generated such that the answer is unique.

 A substring is a contiguous sequence of characters within the string.

  

 Example 1:

 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 Example 2:

 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.
 Example 3:

 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.
  

 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.
  

 Follow up: Could you find an algorithm that runs in O(m + n) time?
 */
func minWindow(_ s: String, _ t: String) -> String {
    var start = 0
    var end = 0
    var length = Int.max
    var left = 0
    var right = 0
    let s = Array(s)
    
    var tCounter = [Character: Int]()
    
    for char in t {
        tCounter[char, default: 0] += 1
    }
    
    var charsRemaining = tCounter.count
    while right < s.count {
        let char = s[right]
        
        tCounter[char, default: 0] -= 1
        if tCounter[char]! == 0 {
            charsRemaining -= 1
            while charsRemaining == 0 {
                if right - left < length - 1 {
                    start = left
                    end = right
                    length = right - left + 1
                }
                tCounter[s[left], default:0] += 1
                if tCounter[s[left]]! == 1 {
                    charsRemaining += 1
                }
                left += 1
            }
        }
        right += 1
    }
    return length == Int.max ? "" : String(s[start...end])
}
