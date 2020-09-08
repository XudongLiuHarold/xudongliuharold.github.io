---
layout: post
title: 53. Maximum Subarray
subtitle: Leetcode Diary
date: 2020-09-06
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - dynamic programming
---

>Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
>
>**Follow up**: If you have figured out the `O(n)` solution, try coding another solution using the divide and conquer approach, which is more subtle.

**Constraints:**

- $$   1 <= nums.length <= 2 * 10^4 $$
- $$   -2^{31} <= nums[i] <= 2^{31} - 1 $$


**Example:**

```bash
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.

Input: nums = [1]
Output: 1

Input: nums = [0]
Output: 0

Input: nums = [-2147483647]
Output: -2147483647
```


#### Thoughts
- 这其实是一道DP问题，但是一开始很难看出来，
- 使用非dp方法：
  - 累加数组，使得每一个位置表示该位置前所有元素的和
  - 遍历累加后的数组，使用`two pointer`的方法，更新`min`
- dp方法：
  - 状态转换方程：`maxSubArray(A, i) = maxSubArray(A, i - 1) > 0 ? maxSubArray(A, i - 1) : 0 + A[i]; `
#### Code(JAVA)

```java
//no dp
public int maxSubArray(int[] nums) {
    if(nums.length == 1)
        return nums[0];
    for(int i = 1; i < nums.length; i++) {
        nums[i] += nums[i-1];
    }
    int res = nums[0];
    int min = nums[0];
    for(int i = 1; i < nums.length; i++) {
        res = Math.max(res,min > 0 ? nums[i] : nums[i] - min);
        min = Math.min(min,nums[i]);
    }
    return res;
}

//dp 
public int maxSubArray(int[] A) {
        int n = A.length;
        int[] dp = new int[n];//dp[i] means the maximum subarray ending with A[i];
        dp[0] = A[0];
        int max = dp[0];
        
        for(int i = 1; i < n; i++){
            dp[i] = A[i] + (dp[i - 1] > 0 ? dp[i - 1] : 0);
            max = Math.max(max, dp[i]);
        }
        
        return max;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
