//
//  Person.swift
//  Person
//
//  Created by pzyyll on 15/11/6.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import Foundation


class Person {
    var name = ""
    var age = 0
    var phone = "" {
        willSet(newVal) {
            if newVal.characters.count != 11 {
                print("手机位数有错哦!")
            } else {
                print("手机位数正确。")
            }
        }
    }
    
    enum Sex: Int {
        case girl = 0, boy;
    }
    var sex: Sex = .girl
    
    var sexChar: String {
        get {
            return sex == .boy ? "男" : "女"
        }
    }
    
    init() {}
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func say(words: String) {
        print("\(words), my name is \(name), I'm \(age) years old, my phone num is \(phone), sex \(sexChar)")
    }
}