//
//  main.swift
//  inheritance
//
//  Created by CAIZHILI on 15/11/4.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

//用户基类
class User {
    var name = "";
    var ID = "";
    
    init(name: String, ID: String) {
        self.name = name;
        self.ID = ID;
    }
    func call() {}
}

//管理员继承用户类，多一个权限位，重载call()函数
class Admin: User {
    var auth = 0;
    init(name: String, ID: String, auth: Int) {
        self.auth = auth;
        super.init(name: name, ID: ID);
    }
    
    override func call() {
        print("I'm a 管理员！");
    }
}

class Student: User {
    
    override func call() {
        print("I'm a student! Call me do what F**k!!!");
    }
}

class Teacher: User {
    
    override func call() {
        print("I'm a teacher!! Dont call me, please!!!!");
    }
}



let allPeople = [
    Teacher(name: "Zhang", ID: "s0001"),
    Student(name: "Li", ID: "b0001"),
    Admin(name: "Hua", ID: "e0001", auth: 2)
]

//实现多态，i是用户基类；
for i in allPeople {
    i.call()
}

let teacherA = Teacher(name: "Zhang", ID: "s0001")
let studentA = Student(name: "Li", ID: "b0001")
let adminA = Admin(name: "Hua", ID: "e0001", auth: 2)

//也可以检测多态属性的call()函数；
func call(user: User) {
    user.call()
}

call(teacherA)
call(studentA)
call(adminA)