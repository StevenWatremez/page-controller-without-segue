//
//  ContainerViewController.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 13/06/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var containerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupSubviews()
  }
  
  private func setupSubviews() {
    if let rootViewController = storyboard?.instantiateViewController(withIdentifier: "PagerViewController") as? PagerViewController {
      
      rootViewController.modelController = self.prepareModelController()
      rootViewController.delegate = self
      
      addChildViewController(rootViewController)
      self.containerView.addSubview(rootViewController.view)
      
      rootViewController.view.frame = containerView.frame
      rootViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      rootViewController.didMove(toParentViewController: self)
    }
  }
  
  private func prepareModelController() -> ModelController {
    let modelController = ModelController()
    let firstDatamodel = DataModel(title: "page 1")
    let secondDatamodel = DataModel(title: "page 2")
    let thirdDatamodel = DataModel(title: "page 3")
    modelController.pageData = [firstDatamodel, secondDatamodel,thirdDatamodel]
    return modelController
  }
}

extension ContainerViewController: TutorialPageViewControllerDelegate {
  
  func tutorialPageViewController(didUpdatePageCount count: Int) {
    pageControl.numberOfPages = count
  }
  
  func tutorialPageViewController(didUpdatePageIndex index: Int) {
    pageControl.currentPage = index
  }
}
