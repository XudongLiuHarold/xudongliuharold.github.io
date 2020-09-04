---
layout: post
title: Leetcode Diary
subtitle: 49. Group Anagrams
date: 2020-09-04
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - hash
---

>Given an array of strings `strs`, group the **anagrams** together. You can return the answer in any order.
>
>An **anagrams** is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**Constraints:**
-   1 <= strs.length <= 104
-   0 <= strs[i].length <= 100
-   strs[i] consists of lower-case English letters.

**Example:**

```bash
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Input: strs = [""]
Output: [[""]]

Input: strs = ["a"]
Output: [["a"]]
```


#### Thoughts

- 关键点是能够把不同的`anagram`使用不同的key区分出来
- 既要保证不是同一个`anagram`的不能有同样的`key`，又要保证是同一个`anagram`的一定是同样的key
- 使用长度为`26`的字符串，每个位置上代表相应字母出现的次数即可。

#### Code(JAVA)

```java
public List<List<String>> groupAnagrams(String[]strs) {
    Map<String,List<String>> map = new HashMap();
    for(String str : strs){
        String key = hash(str);
        List<String> anagrams;
        if(map.containsKey(key))
            anagrams = map.get(key);
        else
            anagrams = new ArrayList();
        anagrams.add(str);
        map.put(key,anagrams);
    }
    return new ArrayList(map.values());
}

private String hash(String str){
    char[] dict = new char[26];
    for(char c : str.toCharArray()){
        dict[c-'a'] ++;
    }
    return String.valueOf(dict);
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
