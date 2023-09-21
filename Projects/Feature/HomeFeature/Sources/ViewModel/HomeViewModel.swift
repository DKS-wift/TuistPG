//
//  HomeViewModel.swift
//  HomeFeatureInterface
//
//  Created by 박의서 on 2023/09/21.
//  Copyright © 2023 com.dks. All rights reserved.
//

import Foundation


final class HomeViewModel {
  
  private var viewType:Int!
  
  
  init(viewType: Int!) {
    self.viewType = viewType
  }
  
  public func printViewType(){
    print(self.viewType)
  }
}
