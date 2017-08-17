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
    if let rootVC = storyboard?.instantiateViewController(withIdentifier: "PagerViewController") as? PagerViewController {
      
      rootVC.modelController = DateModelFactory.fakeModel()
      rootVC.delegate = self
      
      addChildViewController(rootVC)
      self.containerView.addSubview(rootVC.view)
      
      rootVC.view.frame = containerView.frame
      rootVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      rootVC.didMove(toParentViewController: self)
    }
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
