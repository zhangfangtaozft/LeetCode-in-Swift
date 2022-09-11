/*
 16. 3Sum Closest
 
 Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

 Return the sum of the three integers.

 You may assume that each input would have exactly one solution.

  

 Example 1:

 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 Example 2:

 Input: nums = [0,0,0], target = 1
 Output: 0
  

 Constraints:

 3 <= nums.length <= 1000
 -1000 <= nums[i] <= 1000
 -104 <= target <= 104
 */
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sorted = nums.sorted()
        var i = 0
        var min = Int.max
        var res = Int.max

        while i < sorted.count - 2 {
            var j = i + 1
            var k = sorted.count - 1
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if sum == target {
                    return target
                }
                if sum < target {
                    j += 1
                } else {
                    k -= 1
                }
                let diff = abs(sum - target)
                if diff < min {
                    min = diff
                    res = sum
                }
            }
            i += 1
        }
        
        return res
    }
