/*
 The array-form of an integer num is an array representing its digits in left to right order.

 For example, for num = 1321, the array form is [1,3,2,1].
 Given num, the array-form of an integer, and an integer k, return the array-form of the integer num + k.

  

 Example 1:

 Input: num = [1,2,0,0], k = 34
 Output: [1,2,3,4]
 Explanation: 1200 + 34 = 1234
 Example 2:

 Input: num = [2,7,4], k = 181
 Output: [4,5,5]
 Explanation: 274 + 181 = 455
 Example 3:

 Input: num = [2,1,5], k = 806
 Output: [1,0,2,1]
 Explanation: 215 + 806 = 1021
  

 Constraints:

 1 <= num.length <= 104
 0 <= num[i] <= 9
 num does not contain any leading zeros except for the zero itself.
 1 <= k <= 104
 */
func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
    var arrK = [Int]()
    var k = k
    while k > 0 {
        arrK.insert(k % 10, at: 0)
        k /= 10
    }
    
    var num = num
    var index = max(num.count, arrK.count)
    var sumArr = Array(repeating: 0, count: index)
    var carry = 0
    while !num.isEmpty || !arrK.isEmpty {
        let sum = (num.popLast() ?? 0) + (arrK.popLast() ?? 0) + carry
        sumArr[index-1] = sum % 10
        carry = sum / 10
        index -= 1
    }
    
    if carry != 0 {
        sumArr.insert(carry, at: 0)
    }
    
    return sumArr
}
