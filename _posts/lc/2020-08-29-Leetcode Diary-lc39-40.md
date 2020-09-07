---
layout: post
subtitle: Leetcode Diary
title: 39.40 Combination Sum(I II)
date: 2020-08-29
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - backtracking
---

## 39

>Given a set of candidate numbers (`candidates`) **(without duplicates)** and a target number (`target`), find all unique combinations in candidates where the candidate numbers sums to `target`.
>
>The same repeated number may be chosen from `candidates` unlimited number of times.
>Note:
-    All numbers (including `target`) will be positive integers.
-    The solution set must not contain duplicate combinations.


**Example:**

```bash
Input: candidates = [2,3,6,7], target = 7,
A solution set is:
[
  [7],
  [2,2,3]
]

Input: candidates = [2,3,5], target = 8,
A solution set is:
[
  [2,2,2,2],
  [2,3,3],
  [3,5]
]
```
## 40

- Contain duplicate numbers in `candidates`
- Each number in `candidates` may only be used **once** in the combination.

#### Thoughts

- 经典`backtracking`算法
- 一般遇到重复元素的时候使用`sort`数组的方式来解决问题

#### Code(JAVA)

```java
//39
List<List<Integer>> res;
public List<List<Integer>> combinationSum(int[] candidates, int target) {
    res = new ArrayList();
    backtracking(candidates,target,new ArrayList(),0);
    return res;
}

private void backtracking(int[] candidates, int target, List<Integer>cur, int i) {
    if(target == 0) 
        res.add(new ArrayList(cur));
    if(target <= 0)
        return;
    for(int j = i; j < candidates.length; j++) {
        cur.add(candidates[j]);
        backtracking(candidates,target-candidates[j],cur,j);
        cur.remove(cur.size()-1);
    }
}
//40
List<List<Integer>> res;
public List<List<Integer>> combinationSum2(int[] candidates, int target) {
    res = new ArrayList();
    Arrays.sort(candidates);
    backtracking(candidates,target,new ArrayList(),0);
    return res;
}

private void backtracking(int[] can, int target, List<Integer>cur,int i) {
    if(target == 0)
        res.add(new ArrayList(cur));
    if(target <= 0)
        return;
    for(int j = i; j < can.length; j++) {
        if(j > i && can[j] == can[j-1])
            continue;
        cur.add(can[j]);
        backtracking(can,target-can[j],cur,j+1);
        cur.remove(cur.size()-1);
    }
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
