---
layout: post
subtitle: Leetcode Diary
title: 25. Reverse Nodes in k-Group
date: 2020-07-21
author: Xudong
header-img: img/background.jpg
tags: 
   - hard
   - linkedlist
---
>Given a linked list, reverse the nodes of a linked list `k` at a time and return its modified list.
>
>`k` is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.
>
>Follow up:
-    Could you solve the problem in `O(1)` extra memory space?
-    You may not alter the values in the list's nodes, only nodes itself may be changed.


**Example:**

```
Input: head = [1,2,3,4,5], k = 2
Output: [2,1,4,3,5]

Input: head = [1,2,3,4,5], k = 3
Output: [3,2,1,4,5]

Input: head = [1,2,3,4,5], k = 1
Output: [1,2,3,4,5]

Input: head = [1], k = 1
Output: [1]
```

#### Thoughts

- 

#### Code(JAVA)

```java
public ListNode reverseKGroup(ListNode head, int k) {
    if(head == null || k == 1)
        return head;
    ListNode dummyHead = new ListNode(0,head);
    ListNode prev = dummyHead,cur = head;
    int i = 0;
    while(cur != null) {
        i ++;
        if(i % k == 0) {
            prev = reverseList(prev,cur.next);
            cur = prev.next;
        }
        else
            cur = cur.next;
    }
    return dummyHead.next;
}

private ListNode reverseList(ListNode prev, ListNode next) {
    ListNode last = prev.next;
    ListNode cur = last.next;
    
    while(cur != next) {
        last.next = cur.next;
        cur.next =  prev.next;
        prev.next = cur;
        cur = last.next;
    }
    return last;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
