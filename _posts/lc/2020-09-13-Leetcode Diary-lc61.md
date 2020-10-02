---
layout: post
title: 61. Rotate List
subtitle: Leetcode Diary
date: 2020-09-13
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - linkedlist
---

>Given a linked list, rotate the list to the right by `k` places, where `k` is non-negative.

**Example**

```bash
Input: 1->2->3->4->5->NULL, k = 2
Output: 4->5->1->2->3->NULL
Explanation:
rotate 1 steps to the right: 5->1->2->3->4->NULL
rotate 2 steps to the right: 4->5->1->2->3->NULL

Input: 0->1->2->NULL, k = 4
Output: 2->0->1->NULL
Explanation:
rotate 1 steps to the right: 2->0->1->NULL
rotate 2 steps to the right: 1->2->0->NULL
rotate 3 steps to the right: 0->1->2->NULL
rotate 4 steps to the right: 2->0->1->NULL
```

#### Thoughts

- 通过example可以看出，这个题需要的操作其实就是把链表先首尾相连，然后找到合适的地点再切开。
- 问题的关键在于计算需要切开的点，设链表总长度为`length`，根据`len`和`k`可以得到：
$$ 
NewTailPosition = length - \frac{k}{length}
$$
- Step 1 遍历链表，获得链表长度并且将链表首尾相连
- Step 2 找到需要cut的地方，把链表断开

#### Code(JAVA)

```java
public ListNode rotateRight(ListNode head, int k) {
    if(head == null)
        return head;
    //find length and connect tail -> head
    int len = 1;       
    ListNode cur = head;
    while(cur.next!=null) {
        len ++;
        cur = cur.next; 
    }
    cur.next = head;
    cur = head;
    //find new tail
    int tailPos = len - (k % len);
    while(tailPos - 1 > 0){
        cur = cur.next;
        tailPos --;
    }
    //cut new tail -> new head
    if(cur.next == null)
        return head;
    ListNode newHead = cur.next;
    cur.next = null;
    return newHead;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
