---
layout: post
subtitle: Leetcode Diary 
title: 1. Two Sum
date: 2020-04-21
author: Xudong
header-img: img/background.jpg
tags: 
    - leetcode
    - hashmap
    - easy
---

>Given an array of integers, return indices of the two numbers such that they add up to a specific target.
>
>You may assume that each input would have exactly one solution, and you may not use the same element twice.
>
>Example:

```bash
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
```

#### Solution

- 使用一个`hashmap` 来记录`<num,index>`的映射
- 遍历数组
    - 查找map中是否存在`key = target-num`
    - 存在，直接返回结果
    - 不存在，将本次的`<num,index>` 加入map 

#### Code (Java)

```java
    public int[] twoSum(int[] nums, int target) {
        Map<Integer,Integer> indexMapping = new HashMap();
        for(int i = 0; i < nums.length; i++) {
            int key = target - nums[i];
            if(indexMapping.containsKey(key)) {
                int index = indexMapping.get(key);
                return new int []{index, i};
            }
            indexMapping.put(nums[i],i);
        }
        return new int[]{-1,-1};
    }
```
