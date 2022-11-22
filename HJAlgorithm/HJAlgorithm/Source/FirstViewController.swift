//
//  FirstViewController.swift
//  HJAlgorithm
//
//  Created by 夏航军(lu.com) on 2022/11/17.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let r = twoSum([2,5,9,3,6,7], 10)
        print(r)
    }
    

    /*
     给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

     你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

     你可以按任意顺序返回答案。
     */

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            if dict.keys.contains(target-nums[i]) {
                if let index = dict[target-nums[i]]  {
                    return [index, i]
                }
                
            } else {
                dict[nums[i]] = i
            }
        }
        return []
    }

    /*
     给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

     请你将两个数相加，并以相同形式返回一个表示和的链表。

     你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var listNode1 = l1
        var listNode2 = l2
        var resultNode = ListNode()
        var currentNode = resultNode
        var carry = 0
        
        while listNode1 != nil || listNode2 != nil {
            let n1 = listNode1?.val ?? 0
            let n2 = listNode2?.val ?? 0
            let sum = n1 + n2 + carry
            
            
            currentNode.next = ListNode(sum % 10)
            if let listNode = currentNode.next {
                currentNode = listNode
            }
            carry = sum / 10
            if listNode1 != nil {
                listNode1 = listNode1?.next
            }
            if listNode2 != nil {
                listNode2 = listNode2?.next
            }
        }
        
        if carry > 0 {
            currentNode.next = ListNode(carry)
        }
        return resultNode.next
    }
    
}
