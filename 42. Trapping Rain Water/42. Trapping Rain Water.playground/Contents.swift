/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

  

 Example 1:


 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 Example 2:

 Input: height = [4,2,0,3,2,5]
 Output: 9
  

 Constraints:

 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105
 */

func trap(_ height: [Int]) -> Int {
    var sum = 0
    
    var maxRight = Array(repeating: 0, count: height.count)
    var maxHeight = 0
    
    for i in stride(from: height.count - 1, through: 0, by: -1) {
        maxRight[i] = maxHeight
        maxHeight = max(height[i], maxHeight)
    }
    
    maxHeight = 0
    
    for i in 0..<height.count {
        if height[i] < maxHeight && height[i] < maxRight[i] {
            let minHeight = min(maxHeight, maxRight[i])
            sum += minHeight - height[i]
        }
        maxHeight = max(maxHeight, height[i])
    }
    return sum
}
