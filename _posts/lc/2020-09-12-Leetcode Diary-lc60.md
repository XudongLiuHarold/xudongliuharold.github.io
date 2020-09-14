---
layout: post
title: 60. Permutation Sequence
subtitle: Leetcode Diary
date: 2020-09-12
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - backtracking
---

>The set `[1,2,3,...,n]` contains a total of *n!* unique permutations.
>
>By listing and labeling all of the permutations in order, we get the following sequence for n = 3:

1.  "123"
2.  "132"
3.  "213"
4.  "231"
5.  "312"
6.  "321"

>Given n and k, return the `k-th` permutation sequence.
>
>Note:
-    Given n will be between 1 and 9 inclusive.
-    Given k will be between 1 and *n!* inclusive.


**Example**

```bash
Input: n = 3, k = 3
Output: "213"

Input: n = 4, k = 9
Output: "2314"
```

#### Thoughts

- straightforward solution：
  - 按照顺序生成permutation，生成到第k个的时候停止
  - 这种情况下的算法复杂度高达 \\(O(n!)\\)
- 寻找permutation排序的规律,通过寻找每一个位置上第n个数字的规律来直接生成第k个permutation
  - 这种情况下算法的复杂度降为 \\(O(n)\\)
  - 对于第一位数字，可以发现每个数字会重复*n-1!*次，第k个数字的第一位数就是 `k/[(n-1)!] + 1`
  - 对于第二位数字，在确定第一位数字的情况下，可以确定第二个数是第`k'= k%(n-1!)`个，剩下的数字会重复 *n-2!*次，因此第k个数字的第二位就是`k'/[(n-2)!]+1`
  - 这样就有规律如下：
$$ k_1 = k - 1, i_1 = 1 \tag{0}$$
$$ index_i = k_{i} / [(n - i)!] \tag{1} $$
$$ k_{i+1} = k_i - index_i * [(n - i)!] \tag{2}$$

#### Code(JAVA)

```java
public String getPermutation(int n, int k) {
    StringBuilder sb = new StringBuilder();
    ArrayList<Integer> num = new ArrayList<Integer>();
    int fact = 1;
    // num : [1,2,3,...,n]
    // fact: n!
    for (int i = 1; i <= n; i++) {
        fact *= i;
        num.add(i);
    }
    k --;
    for (int i = 0; i < n; i++) {
        fact /= (n - i);
        int index = (k / fact);
        sb.append(num.remove(index));
        k -= index * fact;
    }
    return sb.toString();
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
