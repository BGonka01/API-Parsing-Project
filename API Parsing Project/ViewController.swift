

import UIKit

struct AllFacts: Decodable {
    var catFact: [CatFact]
}

struct CatFact: Decodable {
    let text: String
}

class ViewController: UIViewController {
    

    @IBOutlet weak var catFactLabel: UILabel!
    //let APIKey = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print()
    }
    
    @IBAction func onCatFactButtonTapped(_ sender: UIButton) {
    //APIKey = ""
     parse() }
    
    func parse() {
        let jsonUrlString = "https://cat-fact.herokuapp.com"
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            guard let data = data else { return }
            do {
                let facts = try JSONDecoder().decode([CatFact].self, from: data)
                print(facts)
                
                
                
                
                
                
            } catch let jsonErr {
                print("error serializing data:", jsonErr)
                }
            }.resume()
    }
    
    
    
}






