/*
 Implement strStr().

 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

  

 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
  

 Constraints:

 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 */
func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        
        haystackFor: for i in 0..<haystackArray.count {
            needleFor: for j in 0..<needleArray.count {
                guard (haystackArray.count - 1) - (i + j) >= 0 else {
                    continue haystackFor
                }
                
                guard needleArray[j] == haystackArray[i + j] else {
                    continue haystackFor
                }
            }
            return i
        }
        return -1
}
