import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    // MARK: - Actions
    @IBAction func didTapDemoButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DemoViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DemoViewController") as! DemoViewController
        present(vc, animated: true)
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

    
    @IBAction func didTapTermsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TermsVievController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TermsViewController") 
        navigationController?.pushViewController(vc, animated: true)
    }
}
