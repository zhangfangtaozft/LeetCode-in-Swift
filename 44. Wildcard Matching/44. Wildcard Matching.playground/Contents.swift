/*
 Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*' where:

 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 The matching should cover the entire input string (not partial).

  

 Example 1:

 Input: s = "aa", p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input: s = "aa", p = "*"
 Output: true
 Explanation: '*' matches any sequence.
 Example 3:

 Input: s = "cb", p = "?a"
 Output: false
 Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
 */
func isMatch(_ s: String, _ p: String) -> Bool {
    let s = Array(s)
    let p = Array(p)
    var sp = 0
    var pp = 0
    var match = 0
    var star = -1
    
    while sp < s.count {
        if pp < p.count && (s[sp] == p[pp] || p[pp] == Character("?")) {
            sp += 1
            pp += 1
        } else if pp < p.count && p[pp] == Character("*") {
            star = pp
            match = sp
            pp += 1
        } else if star != -1 {
            pp = star + 1
            match += 1
            sp = match
        } else {
            return false
        }
    }
    
    while pp < p.count && p[pp] == Character("*") {
        pp += 1
    }
    return pp == p.count
}
