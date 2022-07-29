//
//  NavigationBaseController.swift
//  CustomTabBar
//
//  Created by NeedsMoreCoffeee on 7/28/22.
//
import UIKit
class NavigationMenuBaseController: UITabBarController {
    

    // the views we want to show
    let tabItems: [CustomTabItem] = [.home, .search, .spaces, .notifications, .inbox]

        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
        
    }
    
    // load the tab bar
    func loadTabBar() {
        // sets up our custom tab bar view amd adds our view controllers to our tab bar controller
        self.setupCustomTabBar(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        
        // sets our tab bar controller (current file) to our first view
        self.selectedIndex = 0
    }
    
    // this sets up our custom tab bar view and gets an array of view controllers
    func setupCustomTabBar(_ items: [CustomTabItem], completion: @escaping ([UIViewController]) -> Void) {
       
        // initiate an empty array to hold view controllers
        var controllers: [UIViewController] = []

        // adds the custom tab bar view and constraints.
        addCustomTabBarToView(items)
        
        // iterate through our views to add view controllers
        for tabItem in tabItems {
           let vc =  tabItem.viewController
           vc.tabTitle = tabItem.displayTitle
           controllers.append(vc)
        }
        
        // update our view
        self.view.layoutIfNeeded()
        
        // set our completion paramaters for our higher function
        completion(controllers)
        
    }
    
    // changes our selected tab for our TabBarController
    func changeTab(tab: Int) {
            self.selectedIndex = tab
        }
    
    
    // adds the custom bar to our view where our tab bar should be
    func addCustomTabBarToView(_ items: [CustomTabItem]){
        
        
        // sets our tab bar height
        let tabBarHeight: CGFloat = 67.0

        // hide our built in tab bar view
        tabBar.isHidden = true
        
        
        let customTabBar = CustomTabBarView(menuItems: items)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        // instead of creating a delegate, we set the function of out custom tab bar view to our function
        customTabBar.tabTapped = self.changeTab
        
        self.view.addSubview(customTabBar)
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight),
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
    }
}


// MARK: our custom enum used for creating a tab bar

 enum CustomTabItem: String, CaseIterable {
    case home = "home"
    case search = "search"
    case spaces = "spaces"
    case notifications = "notifications"
    case inbox = "inbox"
    
     /// returns a view controller assoiciated with our enum
    var viewController: CustomTabViewVC {
            switch self {
            case .home:
                return ViewController()
            case .spaces:
                return ViewController()
            case .search:
                return ViewController()
            case .notifications:
                return ViewController()
            case .inbox:
                return ViewController()
            }
        }
    
    /// the icon associated with our enum
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "home_icon")!
        case .search:
            return UIImage(named: "search_icon")!
        case .spaces:
            return UIImage(named: "microphone_icon")!
        case .notifications:
            return UIImage(named: "notifications_icon")!
        case .inbox:
            return UIImage(named: "inbox_icon")!
        }
    }
     
     var selectedIcon: UIImage {
         switch self {
         case .home:
             return UIImage(named: "home_icon_selected")!
         case .search:
             return UIImage(named: "search_icon_selected")!
         case .spaces:
             return UIImage(named: "microphone_icon_selected")!
         case .notifications:
             return UIImage(named: "notifications_icon_selected")!
         case .inbox:
             return UIImage(named: "inbox_icon_selected")!
         }
     }
     
    
var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
    
}

