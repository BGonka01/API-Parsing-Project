

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
    
    let fact: String = ""
    
    @IBOutlet weak var catFactLabel: UILabel!
    //let APIKey = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parse()
    }
    
    @IBAction func CatFacts(_ sender: Any) {
        parse()
    }
    
    func parse() {
        let jsonUrlString = "https://cat-fact.herokuapp.com/facts/\(fact)"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else{ return }
            do {
                let facts = try? JSONDecoder().decode(All.self, from: data)
                print(facts?.all)
                for fact in facts{
                    print(fact)
                }
            }
            //                if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary {
            //                    print(jsonData["all"])
            //                    for result in jsonData {
            //                    }
        }
    }.resume()
}


func displayInfo(catfact: String){
    DispatchQueue.main.async {
        self.catFactLabel.text = "fact: \(catfact)"
    }
}
//APIKey = ""
//        parse()

//    func parse() {
//
//        let jsonUrlString = "https://cat-fact.herokuapp.com/facts"
//        guard let url = URL(string: jsonUrlString) else { return }
//        URLSession.shared.dataTask(with: url){ (data, response, err) in
//            guard let data = data else { return }
//            do {
//                if let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary {
//                }
//            }
//
//        } catch let jsonErr {
//            print("error serializing data:", jsonErr)
//        }
//    }

}










