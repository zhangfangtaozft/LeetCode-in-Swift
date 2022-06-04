/*
 Given a string s, find the length of the longest substring without repeating characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  

 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    let s = s.utf8CString.dropLast()
    var cache: [Int] = Array(repeating: 0, count: 128)
    var maxValue: Int = 0
    var j: Int = 0
    var i: Int = 0
    for index in s.indices {
        j = max(j, cache[s[index]])
        cache[s[index]] = i + 1
        maxValue = max(i - j + 1, maxValue)
        i += 1
    }
    return maxValue
}

extension Array {
    subscript(_ i: Int8) -> Element {
        get {
            return self[Int(i)]
        } set(from) {
            self[Int(i)] = from
        }
    }
}

lengthOfLongestSubstring("abcabcbb")
