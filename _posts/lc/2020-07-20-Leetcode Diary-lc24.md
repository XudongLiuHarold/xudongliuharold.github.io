---
layout: post
subtitle: Leetcode Diary
title: 24. Swap Nodes in Pairs
date: 2020-07-20
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - linkedlist
---

>Given a linked list, swap every two adjacent nodes and return its head.
>
> You may **not** modify the values in the list's nodes, only nodes itself may be changed.

**Example:**

```
Given 1->2->3->4, you should return the list as 2->1->4->3.
```

#### Thoughts

- 使用一个dummy head来保证头部不丢失
- 然后使用两个指针`prev`,`cur`
- 遍历更新链表，每次需要交换(`cur`,`cur.next`)：
  - `prev` -> `cur` -> `next`
  - `prev` -> `next` -> `cur`
- 则下一个要交换的就是:`cur.next`和`cur.next.next`这两个，更新`prev`和`cur`
  - `prev` = `cur`
  - `cur` = `cur.next`

#### Code(JAVA)

```java
public ListNode swapPairs(ListNode head) {
    if(head == null || head.next == null)
        return head;
    ListNode dummyHead = new ListNode(0,head);
    ListNode prev = dummyHead, cur = head;
    
    while(cur != null && cur.next != null) {
        ListNode next = cur.next;
        // prev -> cur -> next
        // prev -> next -> cur
        prev.next = next;
        cur.next = next.next;
        next.next = cur;
        // update prev cur
        prev = cur;
        cur = cur.next;
    }
    return dummyHead.next;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
