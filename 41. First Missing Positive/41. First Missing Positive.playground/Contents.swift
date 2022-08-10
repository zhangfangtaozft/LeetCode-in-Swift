/*
 Given an unsorted integer array nums, return the smallest missing positive integer.

 You must implement an algorithm that runs in O(n) time and uses constant extra space.

  

 Example 1:

 Input: nums = [1,2,0]
 Output: 3
 Example 2:

 Input: nums = [3,4,-1,1]
 Output: 2
 Example 3:

 Input: nums = [7,8,9,11,12]
 Output: 1
  

 Constraints:

 1 <= nums.length <= 5 * 105
 -231 <= nums[i] <= 231 - 1
 */
func firstMissingPositive(_ nums: [Int]) -> Int {
    //先把数组排序
    let nums: [Int] = nums.sorted(by: <)
    guard let max = nums.max() else {
        return 1
    }
    
    for i in 0...nums.count - 1 {
        if nums[i] > 0 {
            if nums[i] == nums[0] && nums[i] > 1 {
                return 1
            } else if nums.count > 1 && i > 0 && nums[i - 1] <= 0 && nums[i] > 1 {
                return 1
            } else if nums[i] != max && (nums[i + 1] - nums[i]) > 1 {
                return nums[i] + 1
            } else if nums[i] == max {
                return nums[i] + 1
            }
        }
    }
    return 1
}
