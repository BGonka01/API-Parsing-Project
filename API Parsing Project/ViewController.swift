import UIKit

struct All: Decodable {
    let all: [Text]
}

struct Text: Codable {
    let text: String
}

enum CodingKeys: String, CodingKey {
    case text
}

class ViewController: UIViewController {
    
    var factArray: [String] = []
    var randomFact = String()
    
    @IBOutlet weak var catFactLabel: UILabel!
    //let APIKey = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CatFacts(_ sender: Any) {
        let randomNumber = Int(arc4random_uniform(168))
        parse(number: randomNumber)
//        print(randomNumber)
    }
    
    func parse(number: Int) {
        let jsonUrlString = "https://cat-fact.herokuapp.com/facts/"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else{ return }
            do {
                let facts = try? JSONDecoder().decode(All.self, from: data)
                //               print(facts?.all)
                for fact in (facts?.all)! {
                    self.factArray.append(fact.text)
//                    print(fact.text)
//                    print(self.factArray[0]) //we know this works for only the first element.
//                    print(self.factArray.count)
                }
                print(self.factArray[number])//endIndex is 168
                self.randomFact = self.factArray[number]
            }
            }.resume()
        
            catFactLabel.text = randomFact
    }
    
    
    func displayInfo(catfact: String){
        DispatchQueue.main.async {
            self.catFactLabel.text = "fact: \(catfact)"
        }
        
    }
    
    
    
}



