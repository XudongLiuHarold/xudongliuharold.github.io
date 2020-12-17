---
layout: post
title: 68. Text Justification
subtitle: Leetcode Diary
date: 2020-12-16
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - math
---
https://leetcode.com/problems/text-justification/

>Given an array of words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.
>
>You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.
>
>Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
>
>For the last line of text, it should be left justified and no extra space is inserted between words.

**Note:**

- A word is defined as a character sequence consisting of non-space characters only.
- Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
- The input array words contains at least one word.

**Constraints:**

- 1 <= words.length <= 300
- 1 <= words[i].length <= 20
- words[i] consists of only English letters and symbols.
- 1 <= maxWidth <= 100
- words[i].length <= maxWidth

**Example**

```bash
Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
Output:
[
   "This    is    an",
   "example  of text",
   "justification.  "
]

Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
Output:
[
  "What   must   be",
  "acknowledgment  ",
  "shall be        "
]
Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.
Note that the second line is also left-justified becase it contains only one word.

Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
Output:
[
  "Science  is  what we",
  "understand      well",
  "enough to explain to",
  "a  computer.  Art is",
  "everything  else  we",
  "do                  "
]
```

#### Thoughts

- `divide and conquer`，题目可以分为两部分，第一部分是把所有的`words`根据`maxWidth`的限制分散到每一段里，第二部分则是对于每一段内的`words`进行排版。
- 对于第一个问题，可以使用类似 `sliding window`的思想，窗口大小固定为`maxWidth`，如果超出最大宽度则需要另起一行。
- 对于第二个问题，有两种情况：
  - 当当前是最后一行或者当前行只有一个单词时，排版就是在最后补足空格
  - 其他情况是，则像是一个数学问题，设需要填充的空格总数为`spaceNum`,则有：(1)和(2)
$$averageSpace = spaceNum / (wordsCount -1) \tag{1} $$
$$extraSpaceNum = spaceNum \% (wordsCount -1) \tag{2} $$
  - 剩下的就是需要按照计算结果，先填入extraspacenum个 averagespace+1空格，再填入剩下的空格即可。

```java
public List<String> fullJustify(String[] words, int maxWidth) {
    List<String>res = new ArrayList<String>();
    int len = 0, start = 0;
    for(int i = 0; i < words.length; i++){
        int totalLen = len + i - start + words[i].length();
        if(totalLen > maxWidth) {
            res.add(arrange(words,start,i-1,len,maxWidth));
            start = i;
            len = 0;
        }
        len += words[i].length();
    }
    if(start < words.length) {
        res.add(arrange(words,start,words.length-1,len,maxWidth);
    }
    return res;
}
    
private String arrange(String[] words, int begin, int end, int len, int maxWidth) {
    StringBuilder res = new StringBuilder();
    int i = begin;
    if(begin == end || end == words.length -1) {
        while(i < end) {
            res.append(words[i]);
            res.append(' ');
            i ++;
        }
        res.append(words[end]);
        int j = maxWidth - len - (end - begin);
        while(j > 0) {
            res.append(' ');
            j --; 
        }
        return res.toString();
    }
    int spaceNum = maxWidth - len;
    int averageSpace = spaceNum / (end - begin);
    int extralSpaceNum = spaceNum % (end - begin);
    
    while (i < end) {
        res.append(words[i]);
        int j = averageSpace;
        if (extralSpaceNum != 0) {
            j ++;
            extralSpaceNum --;
        }
        while(j > 0){
            res.append(' ');
            j --;
        }
        i ++;
    }
    res.append(words[end]);
    return res.toString();
}
    
```

<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
