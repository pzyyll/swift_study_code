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

var str = "1http://zhangmenshiting.baidu.com/data2/music/51948781/ZmNsaG1tb2lfn6NndK6ap5WXcJqWa5yckmRnamdrbJpiaZRtZWpqnZaUmZqYl5uel2OZa2ppcGqSlGNqaGaZnWWYY1qin5t1YWBpZGhqaG1iZGNlaGZwbjE$51948781.mp3?xcode=fa5eda246255b17a9043eebffcadff1f75392ab0630be4f0&mid=0.6034151201309689341760http://zhangmenshiting2.baidu.com/data2/music/51948533/ZmNsaG1ramtfn6NndK6ap5WXcJqWa5yckmRnamdrbJpiaZRtZWpqnZaUmZqYl5uel2OZa5aZbm1lamyZmGlpnGeXZFqin5t1YWBpZGhqaG1iZGNlaGZwbjE$51948533.mp3?xcode=fa5eda246255b17a9043eebffcadff1f7ac75489ec32d6e1&mid=0.60341512013096893417603b43390e9d7796cbf754a97c58d8101551464fccmp33418042128"

var title = "稀有动物"
var author = "A-Lin"

author.utf8
var index = strstr(str, "http://")

let session = NSURLSession.sharedSession()
let strUrl = "http://box.zhangmen.baidu.com/x?op=12&count=1&title=稀有动物$$A-Lin$$$$"
print(strUrl.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()))
let url = NSURL(string: strUrl.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
let task = session.dataTaskWithRequest(NSURLRequest(URL: url!)) { (data, response, error) -> Void in
   print(data)
}
task.resume()
