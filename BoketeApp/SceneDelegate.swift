//
//  SceneDelegate.swift
//  BoketeApp
//
//  Created by Jumpei Takeshita on 2020/04/09.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let storyboard:UIStoryboard = self.grabStoryboard()
               
        if let window = window{
                  window.rootViewController = storyboard.instantiateInitialViewController() as UIViewController?
               }
          self.window?.makeKeyAndVisible()
        
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func grabStoryboard() -> UIStoryboard{
            
            var storyboard = UIStoryboard()
            let height = UIScreen.main.bounds.size.height
            if height == 667 {
                storyboard = UIStoryboard(name: "iPhone8", bundle: nil)
            }else if height == 736 {
                //iphone8plus
                storyboard = UIStoryboard(name: "iPhone8Plus", bundle: nil)
            }else if height == 812{
                //XS, 11Pro
                storyboard = UIStoryboard(name: "iPhone11Pro", bundle: nil)
            }else if height == 828{
                //main = XR, 11
                storyboard = UIStoryboard(name: "main", bundle: nil)
            }else if height == 896{
                //11ProMax, XSMax
                storyboard = UIStoryboard(name: "iPhone11ProMAX", bundle: nil)
            }else if height == 1112{
                storyboard = UIStoryboard(name: "iPad", bundle: nil)
            }else{
                
                switch UIDevice.current.model {
                case "iPnone" :
                storyboard = UIStoryboard(name: "se", bundle: nil)
                    break
                case "iPad" :
                storyboard = UIStoryboard(name: "iPad", bundle: nil)
                print("iPad")
                    break
                default:
                    break
                }
            }
            return storyboard
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

