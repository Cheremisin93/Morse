import UIKit

var englishText = "this is secret code"

var lettersToMorse: [String: String] = [
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--..",
    ".": ".-.-.-",
    "!": "-.-.--",
    "?": "..--..",
    ",": "--..--"
]

var moreText = ""

// Кодируем фразу
for i in englishText {
    if let morseChar = lettersToMorse[String(i)] {
        moreText += morseChar + " "
    } else {
        moreText += "  "
    }
}

// Масив для сброра слов
var morseArray = [String]()

var decodedMessage = ""
var currMorse = ""

//Собираем значения в массив
for i in moreText {
    if i != " " {
        currMorse.append(i)
    } else {
        switch currMorse {
        case "":
            currMorse.append(" ")
        case " ":
            morseArray.append(currMorse)
            currMorse = ""
        default:
            morseArray.append(currMorse)
            currMorse = ""
        }
    }
}

var dictionaryMorse: [String: String] = [:]

// Меняем местами ключ/значение для дальнейшего вычисления по ключу
for (i, x) in lettersToMorse {
    dictionaryMorse[x] = i
}

// Декодируем фразу
for i in morseArray {
    if let x = dictionaryMorse[i] {
        decodedMessage.append(x)
    } else {
        decodedMessage.append(" ")
    }
}


