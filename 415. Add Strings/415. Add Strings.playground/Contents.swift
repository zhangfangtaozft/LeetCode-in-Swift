/*
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

 You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

  

 Example 1:

 Input: num1 = "11", num2 = "123"
 Output: "134"
 Example 2:

 Input: num1 = "456", num2 = "77"
 Output: "533"
 Example 3:

 Input: num1 = "0", num2 = "0"
 Output: "0"
  

 Constraints:

 1 <= num1.length, num2.length <= 104
 num1 and num2 consist of only digits.
 num1 and num2 don't have any leading zeros except for the zero itself.
 */
func addStrings(_ num1: String, _ num2: String) -> String {
    let num1Array = Array(num1).compactMap { Int(String($0)) }
    let num2Array = Array(num2).compactMap { Int(String($0)) }
    
    let largerSeqenceCount = num1Array.count >= num2Array.count
        ? num1Array.count
        : num2Array.count

    var resultArray = Array(repeating: 0, count: largerSeqenceCount)
        
    var carry = 0
    
    for i in 0 ..< largerSeqenceCount {
        var num1 = 0
        var num2 = 0
        
        if num1Array.count - 1 - i >= 0 {
            num1 = num1Array[num1Array.count - 1 - i]
        }
        
        if num2Array.count - 1 - i >= 0 {
            num2 = num2Array[num2Array.count - 1 - i]
        }
        
        resultArray[resultArray.count - 1 - i] = (num1 + num2 + carry) % 10
        carry = (num1 + num2 + carry) / 10
    }
    
    if carry > 0 {
        resultArray = [carry] + resultArray
    }
    
    let strArr = resultArray.compactMap { "\($0)" }.joined()
    
    return strArr
}
