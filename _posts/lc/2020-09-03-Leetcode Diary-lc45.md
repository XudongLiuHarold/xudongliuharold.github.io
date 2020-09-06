---
layout: post
subtitle: Leetcode Diary
title: 45. Jump Game II
date: 2020-09-03
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - greedy
---

>Given an array of non-negative integers, you are initially positioned at the first index of the array.
>
>Each element in the array represents your maximum jump length at that position.
>
>Your goal is to reach the last index in the minimum number of jumps.
>
>Note:
>
>You can assume that you can always reach the last index.

**Example:**

```bash
Input: [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2.
    Jump 1 step from index 0 to 1, then 3 steps to the last index.
```


#### Thoughts

- `jumpTime` 表示当前需要跳跃的步数
- `nowJumpable` 表示当前可以跳到的最远距离
- `nextJumpable` 表示付出一步代价后可以跳到的最远距离
- 遍历数组
  - 当`i > nowJumpable`，表示必须要再跳跃一步才能到达`i`了，所以需要更新`jumpTime`和`nowJumpable`
  - 当`i <= nowJumpable`，表示当前仍然在不需要再跳跃能够到达的范围，所以不需要更新步数
  - 每次都更新`nextJumpable`，确保付出一步后能够到达最远的距离

- 这个题目`greedy`的概念有点类似`lazy`的概念，不到实在不行的时候，绝对不多跳任何一步。一旦跳出一步，就要获得最大的收益(max distance).

#### Code(JAVA)

```java
public int jump(int[] nums) {
    int n = nums.length;
    int jumpTime = 0;
    int nowJumpable = 0, nextJumpable = 0;
    for(int i = 0; i < n; i++) {
        if(i > nowJumpable) {
            //pay one step, get max distance can jump
            jumpTime ++;
            nowJumpable = nextJumpable;
        }
        nextJumpable = Math.max(nextJumpable,i+nums[i]);
    }
    return jumpTime;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
