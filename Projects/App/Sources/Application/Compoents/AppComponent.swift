//
//  AppComponent.swift
//  DKS
//
//  Created by 박의서 on 2023/09/21.
//  Copyright © 2023 com.dks. All rights reserved.
//
import UIKit
import Foundation
import NeedleFoundation
import HomeFeature

public final class AppComponent: BootstrapComponent {
    
    var rootComponent: HomeComponent {
           shared {
               HomeComponent(parent: self)
           }
    }
    
  
    
    public func makeRootView() -> HomeViewController {
        rootComponent.makeView()
      }
    
}
