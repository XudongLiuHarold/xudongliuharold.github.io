---
layout: post
subtitle: Leetcode Diary 
title: 3. Longest Substring Without Repeating Characters
date: 2020-06-29
author: Xudong
header-img: img/background.jpg
tags: 
    - sliding window
    - medium
---

> Given a string, find the length of the longest substring without repeating characters.

**Example 1:**

```bash
Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3.
``` 

**Example 2:**
```bash
Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```
**Example 3:**
```bash
Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
```
Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

---

#### Solution

- 维护一个没有重复字符的sliding window -> [left,i]
- 遍历数组，对每一个<index,character>更新sliding window的左侧边界
    - left = MAX(上一次出现这个字符串的地方, left)
- 输出其中最大窗口的长度


- 使用一个hashmap记录每个字符上次出现的地方，使用一个int变量记录当前最大的窗口长度

#### Code (JAVA)

```java
public int lengthOfLongestSubstring(String s) {
   // <char, last time appear index>
   Map<Character, Integer> indexing = new HashM();
   int left = -1, max = 0;
   for(int i = 0; i < s.length(); i++) {
       char c = s.charAt(i);
       left = Math.max(left, indexingetOrDefault(c,-1));
       max = Math.max(max, i - left);
       indexing.put(c,i);
   }
   return max;
}
```