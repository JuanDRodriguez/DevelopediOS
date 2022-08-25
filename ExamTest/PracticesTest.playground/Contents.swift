let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
func getArrayWords(string: String) -> [String]{
    var words: [String] = []
    var mini = 0
    let newString = string.split(separator: " ")
    for word in newString{
        if words.count == 0{
            mini = word.count
            words.append(String(word))
        }else{
            if word.count <= mini {
                mini = word.count
                if String(word).lowercased() == words[0].lowercased(){
                    words.append(String(word))
                }else{
                    words[0] = String(word)
                }
            }
        }
        
    }
    return words
}
print(getArrayWords(string:"I think the solution is Fairly obvius"))
print(getArrayWords(string:"We become what we think about"))
func getIndexAlphabet(string: String) -> String{
    var numberString = ""
    let  newStringChar = Array(string.lowercased())
    for char in newStringChar{
        for i in 0..<alphabet.count{
            if String(char) == alphabet[i]{
                numberString += "\(i+1) "
            }
        }
    }
    return numberString
}
print(getIndexAlphabet(string:"Wow, does that work?"))
