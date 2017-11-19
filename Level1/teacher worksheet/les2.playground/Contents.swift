//: Playground - noun: a place where people can play

import UIKit
// математическое округление
lroundf(21.2)
round(21.2)
// округление в большую сторону
ceil(21.2)
// округление в меньшую сторону
floor(21.2)
//Базовые операторы
var g1 = 10
var g2 = 8
var g1d = 10.0
var g2d = 8.0
var g3 = g1 % g2
g3 = g1 * g2
g3 = g1 + g2
g3 = g1 - g2
var g20 = 3.0
var g21 = pow(g20, 2)
var g11111 = 100
g11111 ^= 1
var g3d  = g1d / g2d
g3d is Int
//g1 = g1 + g2
g1+=g2
//g1 = g1 + 1
g1+=1
g1-=1
g1/=1
g1*=1

g1=g1+g2
g1+=g2
var arr1 = [1,2,3]
var arr2 = [4,5,6]
var arr222 = ["ok"]
//arr1 + arr222
var arr3 = arr1 + arr2
var arr4 = arr1 + [1]
//var arr5: [Int] = [1...100]
//arr5
//arr5[1]
//Оператор ??
var g4: Int? = nil
var g444: Int? = nil
var g5 = g4 ?? 5
var g5555: Int?  = g4 ?? g444
var g5656 = g4 ?? g444 ?? 6
// или
if g4 != nil {
    var g5 = g4
}
else {
    var g5 = 5
}
//Logicl operation
//&& || == !=
g4 == nil
g4 == 1
let stroka = "ok"
if stroka == "ok" && (g4 == 1) {
    print("ok")
}
g4 == nil && g5 == 5
g4 == nil && g5 == 1
g4 != 1 || g5 == 1
let g61 = false
!g61

//перезагрузка операторов
func -( arr1: inout [Int],arr2: [Int]){
    for i in 0 ..< arr1.count {
        arr1[i] = arr1[i] - arr2[i]
    }
}
arr4-arr3
arr4
//func -( a1: Int,a2: Int) -> Int{
//    var tmp = a1 + a2
//    return tmp
//}
4-1
//Индексация
var g6: [String] = ["a", "b", "c"]
g6[2]
// Операции
var g7: Int = 3276900098967676767
var g8: Int = 10
var g9: Int = g7 &* g8
//g9 = g7 * g8
var g77 = 9223372036854775807
var g9999 = g77 &+ 1
//var g9990 = g77 & 0

var g11 = 1...6
var g12 = 1..<6
//g12 = 3
var g12char = "1"..."z"

//let testArr: [Int] = [1...100]
//g12 is Conta
let char1: Character = "a"
if char1 is Character {
    print("ok")
}
//var g121212: [Int] = 1...100
var g10: Int = 1 << 2
var g13 = 0b00000001
var g14 = 0b00000100
var g15 = g13 << 2
var g16 = g14 >> 2
1<<2
0b00000000
//Битовая операция сложения ИЛИ |
g13 | g14
0b00000101
//Битовая операция исключающая И ^ исключающая и сравнивает два бинарных числа беря попарно два значения. если оба 0 - записывается 0, если оба 1 - записывается тоже 0, если значения разные - меняет местами. Заморочался)
g13 ^ g14

//Битовая операция умножение И & !!!!
g13 & g14

//Битовая операция инверсия ~
~g13
-0b10
//тильда ~ обращает (инвертирует) разрады, в том числе разряд, который отвечает за знак, например:00001010 - это 10 в десятичной10001010 - а это -10 в десятичной(первый бит единицы означает знак для Signed (Int) типов)если применить к первому значению (00001010) побитовую инверсию, то получится11110101пример:
let c1212 = Int8(bitPattern: 0b00001010)
let d21212 = ~Int8(bitPattern: 0b11110101)
//конструктор с bitPattern используется для того, чтобы экстра бит (который отвечает за знак) учитывался, иначе перед выражением просто ставится оператор "минус"

let binary = 0b11111111 // 255
let octal = 0o377 // 255
let hexadecimal = 0xff // 255

// Операторы цикла
var g66: [String] = ["a", "b", "c"]
//g66[10]
for j1 in g66 {
    print(j1)
    g66.remove(at:  g66.index(of: j1)! )
}
g66

var zadachaArray: [Int] = []
for i in 10...99 {
    zadachaArray.append(i)
}
zadachaArray
var schet = 0
for value in zadachaArray {
    print(value)
    schet += value
    if (value % 5) == 0 {
        zadachaArray.remove(at: zadachaArray.index(of: value)!)
    }
}
schet

//typealias s123 = String
//var a1: s123 = "ok"
//цикл по кортежу
let j146: (String, Bool) = ("ok", true)
j146.0
j146.1
typealias type = (Exp :String, Res: Bool)
var typeArr: [type] = [("a", true), ("b", false)]
for value: type in typeArr {
    value.Exp
    value.1
}
// цикл по словарю
var dict: [String: Int] = ["yes": 1, "ao": 2]
for (_, value) in dict {
    print(value)
}
for (key, value) in dict {
    print(key)
    print(value)
}
// цикл до 3 версии
//for var i = 1; i < 100; i++ {
//    sin(Double(i))
//}
g66.append("10")
g66.append("11")

for i in 0 ... g66.count {
    sin(Double(i))
    print(i)
}
//аналог, работающий в 3 версии
for  i in 1...100 {
    sin(Double(i))
    Double(i)
    print(i)
}
//обратный цикл
for  i in (1...100).reversed() {
    sin(Double(i))
    Double(i)
    print(i)
}

for i in 1...100 {
    print("")
    if i == 50 {
//        break
        continue
    }
//    if i > 49{
//        continue
//            print(i)
//    }
}
let list: [Int] = [10,11,12,13,14,15,16]
let list2: [Int] = [1,1,1,1,1,1,1]
var resLIst: [Int: Int] = [:]
list[0]

for i in list {
    print(i)
}
for i in 0...list.count-1 {
    print(i)
    print(list[i])
    print(list2[i])
    resLIst[list[i]] = list2[i]
}

resLIst
//цикл с шагом 5 от 10 до 150 включительно
for  i in stride(from: 10, through: 150, by: 5) {
//    sin(Double(i))
//    Double(i)
    print(i)
}
//цикл с шагом 5 от 10 до 145  включительно
for  i in stride(from: 10, to: 150, by: 5)  {
    sin(Double(i))
    Double(i)
    print(i)
}
print("new")
//цикл с шагом 5 от 159 до 10  включительно
for  i in stride(from: 10, through: 150, by: 5).reversed()  {
    print(i)
}
// цикл do(repeat)while
var s2 = 1
var s3 = 5
while s2 < s3  {
    print(s2)
    s2+=1
}


repeat{
    print(s2)
} while s2<s3
var s222 = 2
var s333 = 5
repeat{
    print(s2)
    s222 += 1
} while s222 < s333

// Ветвление if else
if false {
    true
}else if true{
    false
}else if true{
    false
}else if true{
    false
} else {
    true
}
s2
s3

if s3 != s2 {
    print(s3)
} else if s3 > s2 {
    print()
} else {
    print("==")
}
// Ветвление swich
var g99: [String] = ["a", "b", "c","ddasdd"]

switch g99[1] {
case (var s5) where true:
    print(s5)
//    fallthrough
case "b":
    print("b")
//    fallthrough
case "c":
    print("c")
//    fallthrough
case "d":
    print("d")
//    break
default:
//    print("def")
    break
}

//continue

// Ветвление swich с диапазоном
var s8 = 3
switch s8{
case 1...4:
    print("a")
    if s8 >= 2 && s8 <= 4 {
    fallthrough
    }
case 2...7:
    print("b")
default:
    break
}
// Guard
func someFunc() {
    let  someOptional : Int? = 6
    
    guard let constantName = someOptional else {
        print ("someOptional == nil")
        return
    }
    
    let  clearInt : Int = constantName
    print(clearInt)
}

someFunc()


func testGuard(){
    var guardTest = 11
guard guardTest == 11 else {
//    continue; false
    return
}
//    if guardTest == 11 {
//        print("ok")
//        return
//    }
    print("hello")
}
testGuard()

var testArray: [Int] = []
for i in 0...9 {
    testArray.append(i)
}
var countI = 0
for (index, value) in testArray.enumerated() {
    if (value % 2) > 0 {
        testArray[index] += 1
        
    }
    else {
//        testArray.remove(at: testArray.index(of: value)!)
    }
//    countI+=1
}
testArray

//Перечисления
enum E: Int {
    case First = 5
    case One = 1
}

var s: E = .One
s
print(s.rawValue)

enum E1 {
    case First
    case Second
    case Third
}
var s228: E1 = .First
//s222.rawValue
var s111 = E1.First
s111 = .Second

var s112 = E1.Second

var s1: E1 = .First
print(s1)
//print(s1.rawValue)

//import UIKit
//print("sas")
print("Hello", terminator:"\n")

// Функции
func fn1(){
    print("ok")
}

fn1()
fn1()


func fn10() -> Void{
//    return
    print("ok")

}
fn10()

// функция с константным параметром
func func_name1(param1:  Int?) -> Int?{
    return param1
}

let fequal = func_name1(param1: 10)
fequal
func_name1(param1: nil)

// функция возвращает кортеж
typealias type2 = (Exp :String, Res: Bool, Sum: Int, C: Double)
var cort1: type2
typealias num454 = Int
var g3232: num454 = 5

func func_result2() -> type2 {
    return ("ok", true, 5, 0.4)
}
let resF = func_result2()
resF.Exp
resF.Res
resF.C
resF.Sum
resF.1
func func_result3() -> (String, Bool?) {
    return ("ok", nil)
}

func func_name10( param1: String){
//        var param1 = param1 + "dsd"
//        param1
//        param1
//        param1 = param1 + "dsds"
    print(param1)
}

func_name10(param1: "Hello")

//функция с разного рода параметрами
var b = 1
var c = 0

func func_name2(p1: String, b: Int, c: inout Int) -> Int{
    //p1 - const
    //    p1 = "5"
    //b - private var
//    var b = b
//    print(p1)
    print(b)
//    b = 5
//    var b = b
//    b = 5
    var b1 = b
    b1 = 10
    print(b)
    //c -
    c = 10
    return 0
}

func_name2(p1: "ok", b: b, c: &c)
//func_name2("test", b: 1, c: &b)
//func_name2(String, b: <#T##Int#>, c: &<#T##Int#>)
print(b, c)

func test_name(_ param2: String) -> String{
    return param2
}
test_name("ok")

// внешние и внутренние имена переменных
//func_name3(outp1: "test", outp2: 10)


func func_name3( outp1 inp1: String, outp2 inp2: Int) ->String{
    var inp1 = inp1
    inp1+=String(inp2)
    return inp1
}

func_name3(outp1: "test", outp2: 10)
//func_nam
func_name3(outp1: "0k", outp2: 10)
func_name3(outp1: "test2", outp2: 1)
//func
func func3(_ inName: String, param2: Int) {
    
}
func3("ok", param2: 1)
//? почему 10?
c
func func_name4( p1: inout Int) -> Int{
    
    func func_in( p2: inout Int) -> Int{
        return p2+1
    }
    print(c)
    return func_in(p2: &p1)
}
//func_in(p2: 11)
func_name4(p1: &c)
c
// параметр функции по умолчанию
func func_name5( p1: String = "Hello",  p2: String = "world",  p3: String = " ") ->String{
    return p1 + p3 + p2
}

func_name5()
func_name5(p1: "He11o", p2: "wor1d")
func_name5(p1: "He1lo", p2: "w0rld", p3: "_")
let corteg = ("hello", "people", "_")
//func_name5(corteg)
// Functional type
var func_type: (String, String, String) -> String = func_name5
//var func_type2: () -> String = func_name5
func_type("Hello", "world", "_")
//func_type("Hello", "world")

func func_name6(str: String) -> (String, Int?) {
    var a: Int? = str.characters.count
    if a == 0 { a = nil}
    return (str,a)
}

func_name6(str: "dasd")
let f325 = func_name6(str: "")
f325.1

func func_name7(a1: String, a2: Bool) {
    print(a1,a2)
}

var t11111: type = ("1",true)
//func_name7(t11111)

var тест: Int = 0
тест = 1

//рекурсия
INT16_MAX
func rec1(i:Int16){
    var i: Int16 = i
    i = i &+ 1
        rec1(i: i)
}
//rec1(i: 1)
var fdsfsdfsd = 5

//Void


//func testRange(...) {
//    
//}

