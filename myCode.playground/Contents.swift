//: Playground - noun: a place where people can play

import UIKit

/*
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
Movie(name: "Casablanca", director: "Michael Curtiz"),
Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

struct BlackjackCard {
    enum Suit: Character {
        case Spades = "♠️", Hearts = "❤️",
        Diamonds = "♦️", Clubs = "♣️"
    }
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
    
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print(theAceOfSpades.description)

let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue

var tint = 0

arc4random()

extension Int {
    func repetitions (task: ()->()) {
        for _ in 0..<self {
            task()
        }
    }
}

var tree = 4
4.repetitions({print("hello")})

extension Int {
    mutating func squre() {
        self = self * self
    }
}

tree.squre()

var arrInt = [Int]()

for _ in 0..<20 {
    arrInt.append(Int(arc4random() % 100))
}
print(arrInt)

func sort(inout arr: [Int]) {
    for i in 0..<arr.count {
        for iA in 0..<(arr.count - i - 1) {
            if arr[iA] > arr[iA + 1] {
                let t = arr[iA]
                arr[iA] = arr[iA + 1]
                arr[iA + 1] = t
            }
        }
    }
}
sort(&arrInt)
print(arrInt)

func cnt(var num: Int) -> Int{
    var count = 0
    while(num > 0) {
        num = num / 10
        ++count
    }
    return count
}

extension Int {
    subscript(var index: Int) -> Int {
        var count = 0;
        var decimalBase = 1;
        if index >= 0 && index < cnt(self){
            count = cnt(self) - index - 1;
            while(count > 0) {
                decimalBase *= 10
                --count
            }
            return (self / decimalBase) % 10
        }
        return -1
    }
}

123456[9]

protocol FullName {
    var fullName: String { get }
}

class person: FullName {
    var fullName: String
    init(_ fullname: String) {
        self.fullName = fullname
    }
}

let oneperson = person("czl")
oneperson.fullName = "abc"
oneperson.fullName


let flower = ["♦️", "♣️", "❤️", "♠️"]
let pokerNum = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

var poker = [String]()
for i in 0..<pokerNum.count {
    for iA in 0..<flower.count {
        poker.append(flower[iA] + pokerNum[i])
    }
}

var personA = [String]()
var personB = [String]()
var personC = [String]()
var personD = [String]()

var queue = 1
while poker.count > 0 {
    if (poker.count % 13 == 0) &&
        poker.count != 52 {
        ++queue;
    }
    var index = Int(arc4random()) % poker.count;
    switch queue {
    case 1:
        personA.append(poker[index])
        poker.removeAtIndex(index)
    case 2:
        personB.append(poker[index])
        poker.removeAtIndex(index)
    case 3:
        personC.append(poker[index])
        poker.removeAtIndex(index)
    default:
        personD = poker
        poker.removeAll()
    }
}
//personD.sortInPlace()
print(personA)
print(personB)
print(personC)
print(personD)

func sort_str(inout arr: [String]) {
    for i in 0..<arr.count {
        for iA in 0..<(arr.count - i - 1) {
            if (arr[iA] > arr[iA + 1]) {
                let t = arr[iA]
                arr[iA] = arr[iA + 1]
                arr[iA + 1] = t
            }
        }
    }
}

sort_str(&personD)
print(personD)
*/
/*
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
let r = LinearCongruentialGenerator()


class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 0...4 {
    print(d6.roll())
}

protocol HasArea {
    var area: Double { get }
}

protocol tHasArea: HasArea {
    var tarea: Double { get }
}

class Country: HasArea {
    var area: Double
    var two = 0
    init(area: Double) {
        self.area = area
    }
}

let england = Country(area: 100)
let pe = england as HasArea

protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}


extension CollectionType where Generator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map {
            $0.textualDescription
        }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}


let arrD = [
    Dice(sides: 1, generator: LinearCongruentialGenerator()),
    Dice(sides: 2, generator: LinearCongruentialGenerator()),
    Dice(sides: 3, generator: LinearCongruentialGenerator())
]

let oneD = arrD[0]

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, val) in array.enumerate() {
        if val == valueToFind {
            return index
        }
    }
    return nil
}
let abcarr = [1, 2, 3, 4]
let aarr = abcarr[1]
findIndex(abcarr, aarr)

protocol Container {
    typealias ItemType;
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct Stack<T>: Container {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    

    mutating func append(item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}
*/
/*
struct Vector2D {
    var x = 0.0, y = 0.0
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
func - (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x - right.x, y: left.y - right.y)
}
var a = Vector2D(x: 1, y: 2)
var b = Vector2D(x: 2, y: 3)
var c = a + b


prefix func -(vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}
prefix func +(vector: Vector2D) -> Vector2D {
    return vector
}

func +=(inout left: Vector2D, right: Vector2D) {
    left = left + right
}
c.x
c += a
c.x
func -=(inout left: Vector2D, right: Vector2D) {
    left = left - right
}

c -= a
c.x

prefix func ++ (inout vector: Vector2D) -> Vector2D {
    vector += Vector2D(x: 1, y: 1)
    return vector
}
++c.x
c.x
postfix func ++ (inout vector: Vector2D) -> Vector2D {
    let temp = vector
    vector += Vector2D(x: 1, y: 1)
    return temp
}
c++.x
c.x

prefix operator +++ {}

prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}

(+++c).x
c.x
*/
/*
class User {
    var name = "";
    var ID = "";
    
    init(name: String, ID: String) {
        self.name = name;
        self.ID = ID;
    }
    func call() {}
}

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

for i in allPeople {
    i.call()
}

let teacherA = Teacher(name: "Zhang", ID: "s0001")
let studentA = Student(name: "Li", ID: "b0001")
let adminA = Admin(name: "Hua", ID: "e0001", auth: 2)

func call(user: User) {
    user.call()
}

call(teacherA)
call(studentA)
call(adminA)

func callAdmin(user: User) {
    if let admin = user as? Admin {
        print(admin.auth)
    } else if user is Student {
        print("student not auth!")
    } else if user is Teacher {
        print("teacher not auth!")
    }
    switch user {
    case let x where user is Admin:
        let y = x as! Admin;
        var i = 1
        print(++i)
        print(y.auth);
    case _ where user is Student:
        fallthrough
    case _ where user is Teacher:
        print("not auth")
    default:
        break
    }
}

callAdmin(adminA)
callAdmin(studentA)
*/



var str = "abcdefg"

for (i, j) in str.characters.enumerate() {
    print("\(i): \(j)")
}
