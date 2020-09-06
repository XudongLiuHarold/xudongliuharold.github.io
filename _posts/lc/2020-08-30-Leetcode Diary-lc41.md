---
layout: post
subtitle: Leetcode Diary
title: 41. First Missing Positive
date: 2020-08-30
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - array
---

>Given an unsorted integer array, find the smallest missing positive integer.
>
>Your algorithm should run in O(n) time and uses constant extra space.

**Example:**

```bash
Input: [1,2,0]
Output: 3

Input: [3,4,-1,1]
Output: 2

Input: [7,8,9,11,12]
Output: 1
```


#### Thoughts

- 本题要寻找第一个没有的正数，可以建立这样一种映射关系`nums[i] = i + 1`。
- 扫描数组，把所有能够满足上述关系的数字放在相应的位置上。
- 再扫描一边，第一个不满足上述关系的数字就是我们要找的`first missing positive`
- 在`swap`的时候要注意以下情况：
  1. 把一个index小的数swap到index大的同时，也把一个index大的swap到了index小的地方，所以这个时候不能继续顺序扫描下去，而是要以这个刚刚被swap过来的数字为下个遍历对象
  2. 注意可能有重复的值，所以当你想把一个数字放在相应位置上时，要检查该位置是不是已经满足上述映射关系的值了。

#### Code(JAVA)

```java
public int firstMissingPositive(int[] nums) {
    for(int i = 0; i < nums.length; i++) {
        while(nums[i] > 0 && 
           nums[i] <= nums.length &&
           nums[i] != nums[nums[i] -1]) {
            int index = nums[i] -1;
            nums[i] = nums[index];
            nums[index] = index + 1;
        }
    }
    for(int i = 0; i < nums.length; i++) {
        if(nums[i] != i+1)
            return i + 1;
    }
    return nums.length+1;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
