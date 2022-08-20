/*
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

  

 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
  

 Constraints:

 1 <= n <= 45
 */
func climbStairs(_ n: Int) -> Int {
    if n < 2 { return 1 }
    var arr = [Int](repeating: 1, count: n + 1)
    for i in 2..<arr.count {
        arr[i] = arr[i - 1] + arr[i - 2]
    }
    return arr.last!
}
