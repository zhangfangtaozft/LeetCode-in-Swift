/*
 Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

 A palindrome string is a string that reads the same backward as forward.

  

 Example 1:

 Input: s = "aab"
 Output: [["a","a","b"],["aa","b"]]
 Example 2:

 Input: s = "a"
 Output: [["a"]]
  

 Constraints:

 1 <= s.length <= 16
 s contains only lowercase English letters.
 */
func partition(_ s: String) -> [[String]] {
    let n = s.count
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var ans = [[String]]()
    var currentList = [String]()

    dfs(&ans, str: Array(s), n: n, start: 0, &currentList, &dp)
    return ans
}


private func dfs(_ ans: inout [[String]], str: [Character], n: Int, start: Int, _ currentList: inout [String], _ dp: inout [[Bool]]) {
    guard start < n else { ans.append(currentList); return }
        
    for end in start..<n {
        guard str[start] == str[end], (end - start <= 2 || dp[start + 1][end - 1]) else { continue }
        dp[start][end] = true
        currentList.append(String(str[start...end]))
        dfs(&ans, str: str, n: n, start: end + 1, &currentList, &dp)
        currentList.removeLast()
    }
}
