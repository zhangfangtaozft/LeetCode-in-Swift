/*
 A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

 Every adjacent pair of words differs by a single letter.
 Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
 sk == endWord
 Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

  

 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 Example 2:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
 Output: 0
 Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
  

 Constraints:

 1 <= beginWord.length <= 10
 endWord.length == beginWord.length
 1 <= wordList.length <= 5000
 wordList[i].length == beginWord.length
 beginWord, endWord, and wordList[i] consist of lowercase English letters.
 beginWord != endWord
 All the words in wordList are unique.
 */
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    var wordSet = Set(wordList)
    if wordSet.contains(endWord) == false { return 0 }
    
    var beginSet = Set<String>()
    beginSet.insert(beginWord)
    var endSet = Set<String>()
    endSet.insert(endWord)
    var level = 1
    while !(beginSet.isEmpty || endSet.isEmpty) {
        if beginSet.count > endSet.count {
            swap(&beginSet, &endSet)
        }
        
        var newBeginSet = Set<String>()
        for word in beginSet {
            let neighbors = neighbors(word)
            for neighbor in neighbors {
                if endSet.contains(neighbor) {
                    return level + 1
                }
                if wordSet.contains(neighbor) {
                    newBeginSet.insert(neighbor)
                    wordSet.remove(neighbor)
                }
            }
        }
        beginSet = newBeginSet
        level += 1
    }
    return 0
}

private func neighbors(_ str: String) -> [String] {
    var neighbors = [String]()
    var chars = Array(str)
    
    for i in 0..<chars.count {
        let temp = chars[i]
        for j in "abcdefghijklmnopqrstuvwxyz" {
            chars[i] = j
            neighbors.append(String(chars))
        }
        chars[i] = temp
    }
    return neighbors
}
