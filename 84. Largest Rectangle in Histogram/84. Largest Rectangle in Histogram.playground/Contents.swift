/*
 Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

  

 Example 1:


 Input: heights = [2,1,5,6,2,3]
 Output: 10
 Explanation: The above is a histogram where width of each bar is 1.
 The largest rectangle is shown in the red area, which has an area = 10 units.
 Example 2:


 Input: heights = [2,4]
 Output: 4
  

 Constraints:

 1 <= heights.length <= 105
 0 <= heights[i] <= 104
 */

func largestRectangleArea(_ heights: [Int]) -> Int {
    var stack = [Int]()
    let n = heights.count
    var ans = 0
    
    for i in 0..<n {
        while let curHeight = stack.last, heights[curHeight] >= heights[i] {
            stack.removeLast()
            let curWidth = stack.last ?? -1
            ans = max(ans, heights[curHeight] * (i - curWidth - 1))
        }
        stack.append(i)
    }
    
    while !stack.isEmpty {
        let curHeight = stack.removeLast()
        let curWidth = stack.last ?? -1
        ans = max(ans, heights[curHeight] * (n - curWidth - 1))
    }
    return ans
}
