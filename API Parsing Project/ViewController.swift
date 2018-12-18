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
    
    @IBOutlet weak var catFactLabel: UILabel!
    //let APIKey = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parse()
    }
    
    @IBAction func CatFacts(_ sender: Any) {
        parse()
    }
    
    func parse() -> String {
        let jsonUrlString = "https://cat-fact.herokuapp.com/facts/"
        var randomFact = String()
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else{ return }
            do {
                let facts = try? JSONDecoder().decode(All.self, from: data)
                //               print(facts?.all)
                for fact in (facts?.all)! {
                    self.factArray.append(fact.text)
                   randomFact = self.factArray.randomElement()!
//                    print(fact.text)
//                    print(self.factArray)
                    print(self.factArray.count)
                }
            }
            }.resume()
        return randomFact
    }
    
    
    func displayInfo(catfact: String){
        DispatchQueue.main.async {
            self.catFactLabel.text = "fact: \(catfact)"
        }
        
    }
    
    
    
}



