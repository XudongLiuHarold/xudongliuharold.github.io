---
layout: post
title: 55. Jump Game
subtitle: Leetcode Diary
date: 2020-09-09
author: Xudong
header-img: img/background.jpg
tags: 
    - meidum
    - greedy
---

>Given an array of non-negative integers, you are initially positioned at the first index of the array.
>
>Each element in the array represents your maximum jump length at that position.
>
>Determine if you are able to reach the last index.

**Constraints:**

- $$   1 <= nums.length <= 3 * 10^4 $$
- $$   0 <= nums[i][j] <= 10^5 $$


**Example:**

```bash
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
```


#### Thoughts
- 类似[LC45](https://xudongliuharold.github.io/2020/09/03/Leetcode-Diary-lc45/)，但更简单
- 使用`jumpable`来表示当前可以跳到的最远距离
- 如果`i > jumpable` 证明跳不到`i`，`return false`
- 如果`n-1 <= jumpable` 证明已经可以跳到最后， `return true`

#### Code(JAVA)

```java
public boolean canJump(int[] nums) {
    int jumpable = 0;
    for(int i = 0; i < nums.length; i++) {
        if(i > jumpable) 
            return false;
        jumpable = Math.max(jumpable,i+nums[i]);
        if(jumpable >= nums.length-1)
            return true;
    }
    return false;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
