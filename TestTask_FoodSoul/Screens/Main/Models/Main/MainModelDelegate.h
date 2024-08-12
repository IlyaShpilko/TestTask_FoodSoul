//
//  MainModelDelegate.h
//  TestProject
//
//  Created by Ilya Shpilko on 8/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainModelDelegate <NSObject>

-(void)setAssortmentTitle:(NSString*)title;
-(void)updateAssortment:(NSArray*)assortments;

@end

NS_ASSUME_NONNULL_END
