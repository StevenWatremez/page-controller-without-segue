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
    
    if let rootVC = storyboard?.instantiateViewController(withIdentifier: VCNames.pagerVC) as? PagerViewController {
      
      rootVC.modelController = DateModelFactory.fakeModel()
      rootVC.viewControllerDelegate = self
      
      addChild(rootVC)
      self.containerView.addSubview(rootVC.view)

      rootVC.view.frame = self.pagerBounds()
      rootVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      rootVC.didMove(toParent: self)
    }
  }

  // Set the page view controller's bounds using an inset rect
  // so that self's view is visible around the edges of the pages.
  private func pagerBounds() -> CGRect {
    var pageViewRect = self.containerView.frame
    if UIDevice.current.userInterfaceIdiom == .pad {
      pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
    }
    return pageViewRect
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
