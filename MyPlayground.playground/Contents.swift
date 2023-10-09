import UIKit

// easy
//Given an object or an array, return if it is empty.
//
//An empty object contains no key-value pairs.
//An empty array contains no elements.

func isEmpty<T: Collection>(_ arg: T)-> Bool{
    return arg.isEmpty
}

//print(isEmpty([]))
//print(isEmpty(["h":1]))


//
//Given an integer array nums containing distinct positive integers, find and return any number from the array that is neither the minimum nor the maximum value in the array, or -1 if there is no such number.
//
//Return the selected integer.
//
//
//
//Example 1:
//
//Input: nums = [3,2,1,4]
//Output: 2
//Explanation: In this example, the minimum value is 1 and the maximum value is 4. Therefore, either 2 or 3 can be valid answers.
//Example 2:
//
//Input: nums = [1,2]
//Output: -1
//Explanation: Since there is no number in nums that is neither the maximum nor the minimum, we cannot select a number that satisfies the given condition. Therefore, there is no answer.
//Example 3:
//
//Input: nums = [2,1,3]
//Output: 2
//Explanation: Since 2 is neither the maximum nor the minimum value in nums, it is the only valid answer.
func findNonMinOrMax(nums: [Int]) -> Int {
   var minNum = nums.min()
    var maxNum = nums.max()
    for i in nums{
        if !( i == maxNum || i == minNum ){
            return i
        }
    }
    return -1
  }


//print (findNonMinOrMax(nums: [1,2,3,4]))
//print (findNonMinOrMax(nums: [1,2]))



//
//You are given a 0-indexed array words consisting of distinct strings.
//
//The string words[i] can be paired with the string words[j] if:
//
//The string words[i] is equal to the reversed string of words[j].
//0 <= i < j < words.length.
//Return the maximum number of pairs that can be formed from the array words.
//
//Note that each string can belong in at most one pair.
//
//
//
//Example 1:
//
//Input: words = ["cd","ac","dc","ca","zz"]
//Output: 2
//Explanation: In this example, we can form 2 pair of strings in the following way:
//- We pair the 0th string with the 2nd string, as the reversed string of word[0] is "dc" and is equal to words[2].
//- We pair the 1st string with the 3rd string, as the reversed string of word[1] is "ca" and is equal to words[3].
//It can be proven that 2 is the maximum number of pairs that can be formed.
//Example 2:
//
//Input: words = ["ab","ba","cc"]
//Output: 1
//Explanation: In this example, we can form 1 pair of strings in the following way:
//- We pair the 0th string with the 1st string, as the reversed string of words[1] is "ab" and is equal to words[0].
//It can be proven that 1 is the maximum number of pairs that can be formed.
//Example 3:
//
//Input: words = ["aa","ab"]
//Output: 0
//Explanation: In this example, we are unable to form any pair of strings.
//

func maximumNumberOfStringPairs(arr: [String])->Int{
    var count = 0
    var reversedArr = arr.map { String($0.reversed()) }
//    var filterd = reversedArr.filter {
//        string != string($0.reversed())
//
//    }
    var filterd = arr.filter { s in
        s != String(s.reversed())
    }
    
    for s in arr {
        if filterd.contains(String(s.reversed())){
            count+=1
        }
        
    }
     return count/2
}
//print(maximumNumberOfStringPairs(arr:["aa","ab"]))



//Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Every close bracket has a corresponding open bracket of the same type.
//func isValid(_ s: String) -> Bool {
//    var count = 0
//    let valid=["()","[]","{}"]
//    var pairs: [String] = []
//    for (i,char) in s.enumerated() {
//        var nextEle = (i+1)
//        if i == 0 || i%2 == 0{
//            pairs.append(String(char) + s[s.index(s.startIndex, offsetBy: i + 1)])
//        }
//    }
//    for i in pairs {
//        if valid.contains(i){
//            count+=1
//        }
//
//    }
//    if count == pairs.count {
//        return true
//
//    }
//    return false
//}


func isValid(_ s: String) -> Bool {
    let validPairs = ["()","[]","{}"]
    var pairs: [String] = []

    var index = s.startIndex

    while index < s.endIndex {
        let currentChar = s[index]
        index = s.index(after: index)

        // Check if we have a valid pair starting at the current character
        if let pair = validPairs.first(where: { $0.first == currentChar }) {
            pairs.append(pair)
        }
    }

    return pairs.joined() == s
}

// Example usage:
//print(isValid("{}[](")) // Output: true
//print(isValid("{[()]}"))


//You are given an integer n that consists of exactly 3 digits.
//
//We call the number n fascinating if, after the following modification, the resulting number contains all the digits from 1 to 9 exactly once and does not contain any 0's:
//
//Concatenate n with the numbers 2 * n and 3 * n.
//Return true if n is fascinating, or false otherwise.


func isFascinating(_ n: Int) -> Bool {
    if n <= 0 || n > 3333333333 {
          return false
      }
    var dictionary: [Int : Int] = [:]
    var num = String(n) + String( n*2) + String(n*3)
    for  i in num {
        if let  k =  Int(String(i)) {
            if let count = dictionary[k] {
                dictionary[k] = count + 1
            }else {
                dictionary[k] = 1
            }
        }}
    var keys = Array(dictionary.keys)
    var values = Array(dictionary.values)
    if keys.contains(0){
        
        return false
    }
    return keys.count == 9 && values.allSatisfy { $0 == 1 }
    
}

//isFascinating(100)
//isFascinating(192)





//
//You are given a 0-indexed integer array nums. A pair of indices i, j where 0 <= i < j < nums.length is called beautiful if the first digit of nums[i] and the last digit of nums[j] are coprime.
//Return the total number of beautiful pairs in nums.
//Two integers x and y are coprime if there is no integer greater than 1 that divides both of them. In other words, x and y are coprime if gcd(x, y) == 1, where gcd(x, y) is the greatest common divisor of x and y.
func coprime(a:Int , b:Int)->Bool{
    var max = 0
    if a > b {
        max = a
    }else {
        max = b
    }
    for i in 2...max{
        if a % i == 0 && b % i == 0 {
            return false
        }
    }
    return true
}
//print(coprime(a: 8 , b:4))
//print(coprime(a: 8 , b:15))
func firstDigit(a:Int)->Int{
    for i in  String(a) {
       return Int(String(i)) ?? 0
    }
    return 0
}
//firstDigit(a:32)
func lastDigit(b:Int)->Int{
  return b % 10
}

//print(lastDigit(b:32))
func countBeautifulPairs(_ nums: [Int]) -> Int {
    var count = 0
    for (i , ele1) in nums.enumerated() {
        for (j , ele2) in nums.enumerated() {
            if j>i && j < nums.count {
                if coprime(a:firstDigit(a:nums[i]),b: lastDigit(b:nums[j])){
                    count+=1
                }
                
            }
            
            
        }
    }
     return count
 }
//    print( countBeautifulPairs([2,5,1,4]))  //5

//print(countBeautifulPairs([11,21,12])) // 2


//You are given positive integers n and m.
//Define two integers, num1 and num2, as follows:
//num1: The sum of all integers in the range [1, n] that are not divisible by m.
//num2: The sum of all integers in the range [1, n] that are divisible by m.
//Return the integer num1 - num2.

func differenceOfSums(_ n: Int, _ m: Int) -> Int {
    var num1 = 0
    var num2 = 0
    for i  in 1...n{
        if i % m != 0{
            num1+=i
        }else{
            num2+=i
        }
    }
     return num1 - num2
 }

//print(differenceOfSums( 10, 3))
//print(differenceOfSums( 5, 1))


//You are given a 0-indexed integer array nums.
//Return the maximum value over all triplets of indices (i, j, k) such that i < j < k. If all such triplets have a negative value, return 0.
//The value of a triplet of indices (i, j, k) is equal to (nums[i] - nums[j]) * nums[k].
func triples(arr:[Int])->[[Int]]{
    var holder: [[Int]] = []
    for i in 0..<arr.count {
        for j in i+1..<arr.count{
            for k in j+1..<arr.count{
                holder.append([arr[i],arr[j],arr[k]])
            }
        }
    }
    return holder
}

//print(triples(arr: [12,6,1,2,7]))


func maximumTripletValue(_ nums: [Int]) -> Int {
    var triples = triples(arr: nums)
    var max = 0
    for arr in triples{
        if (arr[0] - arr[1]) * arr[2] > max {
            max = (arr[0] - arr[1] ) * arr[2]
        }
    }
    return max
 }
//print(maximumTripletValue([1,2,3]))


//You are given an array nums of positive integers and an integer k.
//In one operation, you can remove the last element of the array and add it to your collection.
//Return the minimum number of operations needed to collect elements 1, 2, ..., k
func TotallyIn(fromZeroToK:[Int] ,deletedEles:[Int] )-> Bool{
    var count = 0
    for i in Set(deletedEles) {
        if fromZeroToK.contains(i){
            count+=1
        }
    }
    if count == fromZeroToK.count{
        return true
    }else {
        return false
    }
    
}
func minOperations(_ nums: [Int], _ k: Int) -> Int {
    var myNums = nums
    let fromZeroToK = Array(1...k)
    var  holder: [Int] = []
    while !TotallyIn(fromZeroToK:fromZeroToK ,deletedEles:holder ){
        if  let lasEle = myNums.popLast() {
            holder.append(lasEle)
        }
       
    }
    return holder.count
 }
//minOperations([3,2,5,3,1] , 3)




//You are given a binary string s that contains at least one '1'.
//You have to rearrange the bits in such a way that the resulting binary number is the maximum odd binary number that can be created from this combination.
//Return a string representing the maximum odd binary number that can be created from the given combination.
//Note that the resulting string can have leading zeros.
func hasOns(s:String)->Int{
    var count = 0
    for i in s {
        if i == "1"{
            count+=1
        }
    }
    return count
}
print(hasOns(s: "100"))
func maximumOddBinaryNumber(_ s: String) -> String {
    var newStr = "1"
    if s.count == 1{
        return s
    }
    var ones = hasOns(s: s)
    var zeros = s.count - ones
    if zeros > 0{
        for _ in 1...zeros{
            newStr.append("0")
        }}
    if ones - 1 > 0{
        for _ in 1...ones-1{
            newStr.append("1")
        }
        
    }
    var i = newStr.count-1
    var result = ""
    while i >= 0 {
        var index = newStr.index(newStr.startIndex , offsetBy: i)
        result.append(newStr[index])
        i-=1
    }
 
    return result
 }
//print(maximumOddBinaryNumber("11")






//You are given a 0-indexed integer array nums and an integer k.
//Return an integer that denotes the sum of elements in nums whose corresponding indices have exactly k set bits in their binary representation.
//The set bits in an integer are the 1's present when it is written in binary.
//For example, the binary representation of 21 is 10101, which has 3 set bits.

func toBinary(num:Int)->String{
    var newStr = ""
    if num == 0 {return ""}
    var myNum = num
    var arr: [Int] = [1]
    for i in 1...num{
        var value = 1
        for _ in 1...i{
            value*=2
        }
        arr.append(value)
    }
    var i = arr.count-1
//    print(arr)
    while i>=0 {
        if arr[i] <= myNum {
            newStr.append("1")
            myNum-=arr[i]
        }
            i-=1
    }
    return newStr
}
//print(toBinary(num: 4))
func sumIndicesWithKSetBits(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    for (i,e) in nums.enumerated() {
//        print(toBinary(num: i+1).count)
        if toBinary(num: i).count == k {
//            print(  toBinary(num: i+1).count  , e)
            count+=e
        }
    }
    return count
}
//var nums = [187,691,248,824,733,593,926,600,187,452,913,192,602,474,634,347,785,702,671,93,43,652,104,476,159,352,450,1,761,828,462,428,24,688,303,830,684,109,455,239,708,912,466,751,694,25,584,982,577,601,857,242,768,20,49,99,120,675,832,662,334,435,687,347,341,498]
//print(sumIndicesWithKSetBits(nums,4))






//You are given a 0-indexed array nums of length n containing distinct positive integers. Return the minimum number of right shifts required to sort nums and -1 if this is not possible.

func minimumRightShifts(_ nums: [Int]) -> Int {
    var myArr = nums
     var sorted = true
    if myArr != myArr.sorted(){
        sorted = false
    }
    var count = 0
    while !sorted {
        sorted = true
        if let lastEle = myArr.popLast(){
            myArr.insert(lastEle, at: 0)
            count+=1
        }
        if myArr != myArr.sorted(){
            sorted = false
        }
        if count == nums.count && sorted == false{
            return -1
        }
        
        
 
     
    }
    return count
 }

print(minimumRightShifts([2,1,4]))


//You are given a 0-indexed 2D integer array nums representing the coordinates of the cars parking on a number line. For any index i, nums[i] = [starti, endi] where starti is the starting point of the ith car and endi is the ending point of the ith car.
//Return the number of integer points on the line that are covered with any part of a car.


func numberOfPoints(_ nums: [[Int]]) -> Int {
    var holder: [Int] = []
    for i in nums {
        for j in i[0]...i[1]{
            holder.append(j)
        }
    }
    return Set(holder).count
  }
numberOfPoints([[1,3],[5,8]])
