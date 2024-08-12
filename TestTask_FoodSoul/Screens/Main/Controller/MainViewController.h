//
//  ViewController.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/2/24.
//

#import <UIKit/UIKit.h>
#import "FilterCollectionView.h"
#import "MainModel.h"
#import "NavigationController.h"
#import "MainModelDelegate.h"

@interface MainViewController : UIViewController <NavigationItemDelegate, FilterDelegate, MainModelDelegate, PromotionCollectionViewDelegate, ProvideBuyViewDelegate, SearchViewDelegate>

@end

