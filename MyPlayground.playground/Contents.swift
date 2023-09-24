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
print(maximumNumberOfStringPairs(arr:["aa","ab"]))
