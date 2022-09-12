/*
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

 Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

  

 Example 1:

 Input: num1 = "2", num2 = "3"
 Output: "6"
 Example 2:

 Input: num1 = "123", num2 = "456"
 Output: "56088"
  

 Constraints:

 1 <= num1.length, num2.length <= 200
 num1 and num2 consist of digits only.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 */

func multiply(_ num1: String, _ num2: String) -> String {
        var digits = [Int](repeating: 0, count: num1.count + num2.count)
        let num1 = Array(num1).map({ Int(String($0))! })
        let num2 = Array(num2).map({ Int(String($0))! })

        for i in stride(from: num1.count - 1, to: -1, by: -1) {
            for j in stride(from: num2.count - 1, to: -1, by: -1) {
                let mult = num1[i] * num2[j]
                let sum = mult + digits[i + j + 1]
                digits[i + j] += sum / 10
                digits[i + j + 1] = sum % 10
            }
        }
        while digits.first == 0 && digits.count > 1 {
            digits.removeFirst()
        }
    
        return digits.map({ String($0) }).joined()
}
