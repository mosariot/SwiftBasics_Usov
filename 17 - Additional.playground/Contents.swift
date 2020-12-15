import Foundation

// объявление функции
func allDigitsToString(text: String) -> String {
// многомерный словарь слов-цифр
    let dictionary: [Int: [Character: String]] = [
        0: ["1": "одиннадцать ", "2": "двенадцать ", "3": "тринадцать ", "4": "четырнадцать ", "5": "пятнадцать ", "6": "шестнадцать ", "7": "семнадцать ", "8": "восемнадцать ", "9": "девятнадцать "],
        1: ["1": "один", "2": "два", "3": "три", "4": "четыре", "5": "пять", "6": "шесть", "7": "семь", "8": "восемь", "9": "девять"],
        2: ["1": "десять ", "2": "двадцать ", "3": "тридцать ", "4": "сорок ", "5": "пятьдесят ", "6": "шестьдесят ", "7": "семьдесят ", "8": "восемьдесят ", "9": "девяносто "],
        3: ["1": "сто ", "2": "двести ", "3": "триста ", "4": "четыреста ", "5": "пятьсот ", "6": "шестьсот ", "7": "семьсот ", "8": "восемьсот ", "9": "девятьсот "],
        4: ["1": "одна тысяча ", "2": "две тысячи ", "3": "три тысячи ", "4": "четыре тысячи ", "5": "пять тысяч ", "6": "шесть тысяч ", "7": "семь тысяч ", "8": "восемь тысяч ", "9": "девять тысяч "],
        5: ["1": "десять тысяч ", "2": "двадцать тысяч ", "3": "тридцать тысяч ", "4": "сорок тысяч ", "5": "пятьдесят тысяч ", "6": "шестьдесят тысяч ", "7": "семьдесят тысяч ", "8": "восемьдесят тысяч ", "9": "девяносто тысяч "]
    ]
 // создание пустого результирующего массива
    var resultArray: [String] = []
// введение счетчика текущего разряда цифры
    var countOfDigits = 0
// переменная для запоминания последнего прочтенного символа
// инициализация "0" из-за того, что Character нельзя иниацилизировать пустым
// а тип String здесь приведет к усложнению кода
    var lastSymbol: Character = "0"
// проверка всех символов в строке, подвергнутой реверсу
// реализация через реверс строки нужна для корректной последовательной проверки текущего разряда цифры
    for element in text.reversed() {
// прибавляение разряда текущей цифры
        countOfDigits += 1
// ограничение числа до менее 100000
        guard countOfDigits <= 5 else {
            return "Число в строке слишком большое"
        }
// проверка символа на то, что он цифра и какая цифра
        switch element {
        case "0":
// проверка символа на то, что он 0 и является единственным в числе
            if text.reversed().count == 1 {
                return "Ноль"
            } else {
// обновление последнего прочтенного символа
            lastSymbol = element
// и просто переход на следующую итерацию
                continue }
// проверка символа на то, какая он цифра
// если это единица, входящая в 10-19, то
        case "1" where countOfDigits == 2:
// если единица входит в число 10, то
            if resultArray.count == 0 {
// добавление в результирующий массив слова-цифры
                resultArray.append(dictionary[countOfDigits]![element]!)
// если единица входит в 11-19, то
            } else {
// убираем последнее слово-цифру (один-девять), так как его нужно будет заменить новым - одиннадцать-девятнадцать
                resultArray.removeLast()
// добавление в результирующий массив слова-цифры
                resultArray.append(dictionary[0]![lastSymbol]!)
            }
// если это единица, входящая в 11000-19000, то
        case "1" where countOfDigits == 5 && lastSymbol != "0":
// убираем последнее слово-цифру (один-девять), так как его нужно будет заменить новым - одиннадцать-девятнадцать тысяч
            resultArray.removeLast()
// добавление в результирующий массив слова-цифры
            resultArray.append(dictionary[0]![lastSymbol]! + "тысяч ")
// если это случаи 2хххх, 3хххх, 4хххх, 5хххх, 6хххх, 7хххх, 8хххх, 9хххх (когда не нужно прибавлять слово "тысяч")
        case "1" where countOfDigits == 5 && lastSymbol != "0", "2" where countOfDigits == 5 && lastSymbol != "0", "3" where countOfDigits == 5 && lastSymbol != "0", "4" where countOfDigits == 5 && lastSymbol != "0", "5" where countOfDigits == 5 && lastSymbol != "0", "6" where countOfDigits == 5 && lastSymbol != "0", "7" where countOfDigits == 5 && lastSymbol != "0", "8" where countOfDigits == 5 && lastSymbol != "0", "9" where countOfDigits == 5 && lastSymbol != "0":
// доступ к элементу словаря в зависимости от разряда цифры по порядку
// и добавление в результирующий массив слова-цифры
            resultArray.append(dictionary[countOfDigits - 3]![element]!)
// обычный общий случай с цифрами
        case "1", "2", "3", "4", "5", "6", "7", "8", "9":
// доступ к элементу словаря в зависимости от разряда цифры по порядку
// и добавление в результирующий массив слова-цифры
            resultArray.append(dictionary[countOfDigits]![element]!)
// обновление последнего прочтенного символа
            lastSymbol = element
// если символ не цифра, то просто добавляем его в строку и сбрасываем счетчик разрядов цифр
        default:
            resultArray.append(String(element))
            countOfDigits = 0
        }
    }
// реверс результирующего массива, преобразование массива в финальную строку
    return String(resultArray.reversed().reduce("", +))
}

// _______________________________________________________________________________________________

allDigitsToString(text: "14010")

func allDigitsToStringNoComments(text: String) -> String {
    let dictionary: [Int: [Character: String]] = [
        0: ["1": "одиннадцать ", "2": "двенадцать ", "3": "тринадцать ", "4": "четырнадцать ", "5": "пятнадцать ", "6": "шестнадцать ", "7": "семнадцать ", "8": "восемнадцать ", "9": "девятнадцать "],
        1: ["1": "один", "2": "два", "3": "три", "4": "четыре", "5": "пять", "6": "шесть", "7": "семь", "8": "восемь", "9": "девять"],
        2: ["1": "десять ", "2": "двадцать ", "3": "тридцать ", "4": "сорок ", "5": "пятьдесят ", "6": "шестьдесят ", "7": "семьдесят ", "8": "восемьдесят ", "9": "девяносто "],
        3: ["1": "сто ", "2": "двести ", "3": "триста ", "4": "четыреста ", "5": "пятьсот ", "6": "шестьсот ", "7": "семьсот ", "8": "восемьсот ", "9": "девятьсот "],
        4: ["1": "одна тысяча ", "2": "две тысячи ", "3": "три тысячи ", "4": "четыре тысячи ", "5": "пять тысяч ", "6": "шесть тысяч ", "7": "семь тысяч ", "8": "восемь тысяч ", "9": "девять тысяч "],
        5: ["1": "десять тысяч ", "2": "двадцать тысяч ", "3": "тридцать тысяч ", "4": "сорок тысяч ", "5": "пятьдесят тысяч ", "6": "шестьдесят тысяч ", "7": "семьдесят тысяч ", "8": "восемьдесят тысяч ", "9": "девяносто тысяч "]
    ]
    var resultArray: [String] = []
    var countOfDigits = 0
    var lastSymbol: Character = "0"
    for element in text.reversed() {
        countOfDigits += 1
        guard countOfDigits <= 5 else {
            return "Число в строке слишком большое"
        }
        switch element {
        case "0":
            if text.reversed().count == 1 {
                return "Ноль"
            } else {
            lastSymbol = element
                continue }
        case "1" where countOfDigits == 2:
            if resultArray.count == 0 {
                resultArray.append(dictionary[countOfDigits]![element]!)
            } else {
                resultArray.removeLast()
                resultArray.append(dictionary[0]![lastSymbol]!)
            }
        case "1" where countOfDigits == 5 && lastSymbol != "0":
            resultArray.removeLast()
            resultArray.append(dictionary[0]![lastSymbol]! + "тысяч ")
        case "1" where countOfDigits == 5 && lastSymbol != "0", "2" where countOfDigits == 5 && lastSymbol != "0", "3" where countOfDigits == 5 && lastSymbol != "0", "4" where countOfDigits == 5 && lastSymbol != "0", "5" where countOfDigits == 5 && lastSymbol != "0", "6" where countOfDigits == 5 && lastSymbol != "0", "7" where countOfDigits == 5 && lastSymbol != "0", "8" where countOfDigits == 5 && lastSymbol != "0", "9" where countOfDigits == 5 && lastSymbol != "0":
            resultArray.append(dictionary[countOfDigits - 3]![element]!)
        case "1", "2", "3", "4", "5", "6", "7", "8", "9":
            resultArray.append(dictionary[countOfDigits]![element]!)
            lastSymbol = element
        default:
            resultArray.append(String(element))
            countOfDigits = 0
        }
    }
    return String(resultArray.reversed().reduce("", +))
}

allDigitsToStringNoComments(text: "14010")
