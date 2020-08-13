---
layout: post
title: Leetcode Diary
subtitle: 18. 4Sum
date: 2020-07-14
author: Xudong
header-img: img/background.jpg
tags: 
    - two pointers
    - medium
---

>Given an array `nums` of `n` integers and an integer `target`, are there elements a, b, c, and d in `nums` such that a + b + c + d = `target`? Find all unique quadruplets in the array which gives the sum of `target`.
>
>Note:
>
>The solution set must not contain duplicate quadruplets.

**Example:**

```
Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.

A solution set is:
[
  [-1,  0, 0, 1],
  [-2, -1, 1, 2],
  [-2,  0, 0, 2]
]
```

#### Thoughts

- 使用一个for循环变成 [3 Sum](https://xudongliuharold.github.io/2020/07/11/Leetcode-Diary-lc15/)
- 使用同样的方法解决

#### Code(JAVA)

```java
    public List<List<Integer>> fourSum(int[] nums, int target) {
        List<List<Integer>> res = new ArrayList();
        Arrays.sort(nums);
        for(int i = 0; i < nums.length - 3; i ++) {
            if(i > 0 && nums[i] == nums[i-1])
                continue;  
            for(int j = i + 1; j < nums.length - 2; j ++) {
                if(j > i+1 && nums[j] == nums[j-1])
                    continue;
                int l = j + 1, r = nums.length - 1;
                while(l < r) {
                    if(l>j+1 && nums[l] == nums[l-1]){
                        l++;
                        continue;
                    }                    
                    if(nums[i] + nums[j] + nums[l] + nums[r] == target) {
                        res.add(new ArrayList(Arrays.asList(nums[i],
                                                            nums[j],
                                                            nums[l],
                                                            nums[r])));
                        l ++;
                        r --;
                    }
                    else if(nums[i] + nums[j] + nums[l] + nums[r] < target)
                        l ++;
                    else
                        r --;
                }                
            }
        }
        return res;
    }
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
