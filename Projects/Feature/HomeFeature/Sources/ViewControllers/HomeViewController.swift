//
//  HomeViewController.swift
//  HomeFeatureInterface
//
//  Created by 박의서 on 2023/09/21.
//  Copyright © 2023 com.dks. All rights reserved.
//

import UIKit

public class HomeViewController: UIViewController {

  
  var viewModel:HomeViewModel!
  
  let button:UIButton = {
    
    let btn:UIButton = UIButton()
    btn.setTitle("Hello", for: .normal)
    
    return btn
  }()
  
  init(viewModel:HomeViewModel){
    super.init(nibName: nil, bundle: nil)
    self.viewModel = viewModel
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    public override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
      self.view.backgroundColor = .blue
      button.translatesAutoresizingMaskIntoConstraints = false
      self.view.addSubview(button)
      
      button.widthAnchor.constraint(equalToConstant: 200).isActive = true
      button.heightAnchor.constraint(equalToConstant: 200).isActive = true
      
      button.center = self.view.center
    }
    



}
