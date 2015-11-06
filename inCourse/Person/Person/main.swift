//
//  main.swift
//  Person
//
//  Created by pzyyll on 15/11/6.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import Foundation

let onePerson = Person(name: "czl", age: 100)
onePerson.sex = .boy
onePerson.phone = "13342232190"
print(onePerson.sex)
print(onePerson.sexChar)

onePerson.say("Hello!!")

