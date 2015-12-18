//: Playground - noun: a place where people can play

import UIKit

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