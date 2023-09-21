//
//  HomeComPonent.swift
//  HomeFeatureInterface
//
//  Created by 박의서 on 2023/09/21.
//  Copyright © 2023 com.dks. All rights reserved.
//

import Foundation
import NeedleFoundation

public protocol HoemDependency:Dependency {
  
}

public final class HomeComponent : Component<HoemDependency> {
  
  public func makeView() -> HomeViewController {
    
      return HomeViewController(viewModel: HomeViewModel(viewType: 0))
  }
  
}
