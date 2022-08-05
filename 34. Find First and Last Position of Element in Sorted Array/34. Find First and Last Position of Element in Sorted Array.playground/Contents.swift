/*
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

 If target is not found in the array, return [-1, -1].

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 Example 3:

 Input: nums = [], target = 0
 Output: [-1,-1]
  

 Constraints:

 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 nums is a non-decreasing array.
 -109 <= target <= 109
 */

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var arr = [-1, -1]
    if nums.isEmpty { return arr }
    var lhs = 0, rhs = nums.count - 1
    while lhs < rhs {
        let mid = lhs + (rhs - lhs) / 2
        nums[mid] < target ? (lhs = mid + 1) : (rhs = mid)
    }
    
    guard nums[lhs] == target else { return arr }
    arr[0] = lhs
    rhs = nums.count - 1
    while lhs < rhs {
        let mid = lhs + (rhs - lhs) / 2 + 1
        nums[mid] > target ? (rhs = mid - 1) : (lhs = mid)
    }
    arr[1] = lhs
    return arr
}

