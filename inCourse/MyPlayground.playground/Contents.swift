//: Playground - noun: a place where people can play

import UIKit
/*
let string = "Hello world"
let utf8Encode = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)

print(utf8Encode)

utf8Encode?.bytes
print(utf8Encode?.bytes)
print(utf8Encode!.length)
var stringFromData = NSString(bytes: utf8Encode!.bytes, length: utf8Encode!.length, encoding: NSUTF8StringEncoding)

let base64Encode = utf8Encode?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
let base64Nsdata = NSData(base64EncodedString: base64Encode!, options: NSDataBase64DecodingOptions(rawValue: 0))
let vase64encodeData = utf8Encode?.base64EncodedDataWithOptions(NSDataBase64EncodingOptions(rawValue: 0))

let string1 = NSString(data: base64Nsdata!, encoding: NSUTF8StringEncoding)
let string2 = NSString(data: vase64encodeData!, encoding: NSUTF8StringEncoding)


let muUrl = NSURL(string: "file:///path/to/web_root/")
let url = NSURL(string: "folder", relativeToURL: muUrl)
url?.absoluteURL
url?.absoluteString

let path = NSURL.fileURLWithPath("/sayHello")
let pathD = NSURL.fileURLWithPath("/sayHello", isDirectory: true)

var url2 = NSURL(string: "https://ooly.club:443/phpmyadmin/php?sec=5#abcdef")
url2?.scheme
url2?.host
url2?.port
url2?.query
url2?.fragment

url2?.lastPathComponent
url2?.path
url2?.password
url2?.pathComponents
url2?.relativePath

var temp = url2?.URLByAppendingPathComponent("abcd", isDirectory: true)

print(temp)
temp = temp?.URLByAppendingPathComponent("ccd?abc=4&")
print(temp)
print(
temp?.URLByDeletingLastPathComponent
)
print(
temp?.URLByDeletingPathExtension
)
temp?.URLByDeletingLastPathComponent
temp?.query
print(temp)


let commponent = NSURLComponents(URL: temp!, resolvingAgainstBaseURL: true)
print(
commponent?.URL
)
print(

commponent?.URLRelativeToURL(url!)
)
commponent?.user
commponent?.password
commponent?.path
commponent?.query
commponent?.fragment

commponent?.host
print(
UIDevice.currentDevice().identifierForVendor!
)



var dict = [String: String]()
dict["abc"] = "abcde"
for (x, y) in dict {
    print(x)
    print(y)
}

class item {
    var i = 0
}

var nSection = NSMutableArray()
var aSec = NSMutableArray()

nSection.addObject(aSec)
nSection.addObject("ab")
nSection[0].addObject("string")
nSection[0].addObject("jjj")
let a = nSection[0][0]

let date = NSDate()
let datej = NSDateFormatter()
datej.dateFormat = "yyyy-MM-dd HH:mm"
var time = datej.stringFromDate(date)
let range = time.startIndex...time.endIndex.advancedBy(-6)
time.substringWithRange(range)

var arr1 = NSMutableArray()
var arr2 = NSMutableArray()

arr1.addObject("abc")
arr1.addObject("cde")

arr2 = arr1.mutableCopy() as! NSMutableArray;

arr2.removeLastObject()

var time1 = NSDate()
datej.dateFormat = "yyyy-MM-dd HH:mm:ss"

func == (letf: test, right: test) -> Bool {
    return letf.str == right.str
}
class test {
    var str = ""
    init(str: String) {
        self.str = str
    }
}

arr1.removeAllObjects()
arr1.addObject(test(str: "abc"))
arr1.addObject(test(str: "abcde00"))
arr1.addObject(test(str: "ccc"))

arr2 = arr1.mutableCopy() as! NSMutableArray

for item in arr1 {
    if (arr2[1] as! test) == (item as! test){
        print((item as! test).str)
        (item as! test).str = "123"
    }
}
arr1
*/

var dict = ["12": "abc"]
dict["432"] = "cbd"
dict
dict.count
