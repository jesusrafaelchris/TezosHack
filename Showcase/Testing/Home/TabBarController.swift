import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
        
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // remove top line
        tabBar.tintColor = .orange
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .orange.withAlphaComponent(0.9)
}

// Tab Bar Specific Code
override func viewDidAppear(_ animated: Bool) {
    
    let home = HomeViewController()
    let homeimage = UIImage(systemName: "house")
    let homeselected = UIImage(systemName: "house.fill")
    home.tabBarItem =  UITabBarItem(title: "Home", image: homeimage, selectedImage: homeselected)
   
    // need to move this to custom button
    let groups = ProfileViewController()
    let ticketImage = UIImage(systemName: "person")
    let ticketselected = UIImage(systemName: "persons.fill")
    groups.tabBarItem = UITabBarItem(title: "Account", image: ticketImage, selectedImage: ticketselected)

    let tabbarList = [home, groups]
    
    viewControllers = tabbarList.map {
        UINavigationController(rootViewController: $0)
    }
 
    }
 }
