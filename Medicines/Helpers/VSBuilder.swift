//
//  VSBuilder.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import UIKit

class VSBuilder {
    class func createMainVC() -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainStory")
        controller.modalPresentationStyle = .fullScreen
        return controller
    }

    class func createDetailVC() -> UIViewController{
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detailStory")
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
    
}
