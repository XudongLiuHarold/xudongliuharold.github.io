---
layout: post
subtitle: Leetcode Diary
title: 38. Count and Say
date: 2020-08-29
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - backtracking
---

## 39

>The count-and-say sequence is the sequence of integers with the first five terms as following:

```
1.     1
2.     11
3.     21
4.     1211
5.     111221
```
- `1` is read off as `"one 1"` or `11`.
- `11` is read off as `"two 1s"` or `21`.
- `21` is read off as `"one 2, then one 1"` or `1211`.

>Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. You can do so recursively, in other words from the previous member read off the digits, counting the number of digits in groups of the same digit.
>
>Note: Each term of the sequence of integers will be represented as a string.


**Example:**

```bash
Input: 1
Output: "1"
Explanation: This is the base case.

Input: 4
Output: "1211"
Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", so the answer is the concatenation of "12" and "11" which is "1211".
```

#### Thoughts

- 首先，按照题目实现如何`say`一个string，
- 然后递归`say`找到答案即可

#### Code(JAVA)

```java
public String countAndSay(int n) {
    return n == 1? "1" : say(countAndSay(n-1));
}
private String say(String seq) {
    StringBuilder res = new StringBuilder();
    int count = 1;
    int i = 0;
    while(i < seq.length()) {
        if(i+1 >= seq.length() || seq.charAt(i) != seq.charAt(i+1)) {
            res.append(count);
            res.append(seq.charAt(i));
            count = 1;
        }
        else
            count ++;
        i++;
    }
    return res.toString();
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
