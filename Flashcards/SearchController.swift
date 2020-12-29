


import UIKit
import WebKit

class SearchController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    var flashcard: Flashcard?
    let baseSearchURL = "http://google.com/search?q=apple developer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let card = flashcard,
            let escapedURLString = searchURLString(base: baseSearchURL, term: card.term),
            let url = URL(string: escapedURLString) {
            webView.load(URLRequest(url: url))
        }
    }
    
    
    private func searchURLString(base: String, term: String) -> String? {
        return "\(baseSearchURL) \(term)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed, using: .unicode)
    }
    
    
//    private func searchURLString(base: String, term: String) -> String? {
//        return "\(baseSearchURL) \(term)"
//            .stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
//    }

}

extension String {
    func addingPercentEncoding(withAllowedCharacters characterSet: CharacterSet, using encoding: String.Encoding) -> String {
        let stringData = self.data(using: encoding, allowLossyConversion: true) ?? Data()
        let percentEscaped = stringData.map {byte->String in
            if characterSet.contains(UnicodeScalar(byte)) {
                return String(UnicodeScalar(byte))
            } else if byte == UInt8(ascii: " ") {
                return "+"
            } else {
                return String(format: "%%%02X", byte)
            }
            }.joined()
        return percentEscaped
    }
}
