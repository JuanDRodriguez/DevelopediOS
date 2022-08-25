import UIKit

 //let string = "I think the solution is fairly obvious."
let string = "Hola me llamo alejandro,   me llamo juan"
   
func getArrayWordsRepeat(string: String)-> [String]{
    let arrayWords = string.split(separator: " ")
    var wordsRepeat = [String]()
    for word in arrayWords {
        if wordsRepeat.count == 0{
            wordsRepeat.append(String(word))
        }else{
            if String(word).count <= wordsRepeat[0].count{
                if String(word) == wordsRepeat[0] {
                    wordsRepeat.append(String(word))
                }else {
                    wordsRepeat[0] = String(word)
                }
            }
        }
    }
    return wordsRepeat
}
print("\(getArrayWordsRepeat(string: string.lowercased()))")
