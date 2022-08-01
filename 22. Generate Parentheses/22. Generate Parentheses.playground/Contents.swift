/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

  

 Example 1:

 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:

 Input: n = 1
 Output: ["()"]
  

 Constraints:

 1 <= n <= 8
 */
func generateParenthesis(_ n: Int) -> [String] {
    var list: [Int] = [n, n]
    var result: [String] = []
    var path: [Character] = []
    process(&list, &path, &result)
    return result
}

func process(_ list: inout [Int], _ path: inout [Character], _ result: inout [String]) {
    if list.reduce(0, +) == 0 {
        result.append(String(path))
        return
    }
    
    for i in 0..<2 {
        if list[i] == 0 {
            continue
        }
        
        if i == 1, list[i - 1] >= list[i] {
            continue
        }
        
        path.append(i == 0 ? "(" : ")")
        list[i] -= 1
        process(&list, &path, &result)
        path.removeLast()
        list[i] += 1
    }
}
