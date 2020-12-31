

import UIKit

class DefinitionController: UIViewController {

    @IBOutlet weak var definition: UITextView!
    var flashcard: Flashcard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let card = flashcard {
            definition.text = card.definition
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let searchController = segue.destination as? SearchController {
            searchController.flashcard = flashcard
        }
    }
    
}
