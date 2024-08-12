//
//  MainModel.m
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

#import "MainModel.h"

@implementation MainModel {
    FilterModel *selectedFilter;
    NSMutableArray *assortments;
}

@synthesize inset;
@synthesize provide;
@synthesize filters;

- (instancetype)init
{
    self = [super init];
    if (self) {
        inset = 12.0;
        provide = [ProvideModel new];
        selectedFilter = [[FilterModel alloc] init:[[ObjcFilter alloc]initWith: ObjcFilterTypeWeRecommend].text andSelected:YES andTextColor:UIColor.redColor];
        filters = [
            [NSArray alloc]
            initWithObjects:
            selectedFilter,
            [[FilterModel alloc] init:[[ObjcFilter alloc]initWith: ObjcFilterTypePopular].text andSelected: NO andTextColor:UIColor.redColor],
            [[FilterModel alloc] init:[[ObjcFilter alloc]initWith: ObjcFilterTypeJapaneseFood].text andSelected: NO andTextColor:UIColor.whiteColor],
            [[FilterModel alloc] init: [[ObjcFilter alloc]initWith: ObjcFilterTypeFavorite].text andSelected: NO andTextColor:UIColor.whiteColor],
            nil];
        [self createAssorments];
        [self updateAssortment: selectedFilter];
    }
    return self;
}

-(void)setStartSettings {
    [self updateAssortment:selectedFilter];
}

-(void)updateAssortment:(FilterModel*)filter {
    [_delegate setAssortmentTitle:filter.name];
    NSMutableArray *assortmentsWithFilter = [NSMutableArray new];

    if ([filter.name  isEqual: [[ObjcFilter alloc]initWith:ObjcFilterTypeFavorite].text]) {
        for (int i = 0; i < assortments.count; i++) {
            ObjcAssortmentEntity *entity = [self getAssortment:i];
            if (entity.isFavorite) {
                [assortmentsWithFilter addObject:entity];
            }
        }
    } else {
        for (int i = 0; i < assortments.count; i++) {
            ObjcAssortmentEntity *entity = [self getAssortment:i];
            for (int j = 0; j < entity.category.count; j++) {
                if ([entity.category[j] isEqualType:[filter name]]) {
                    [assortmentsWithFilter addObject:entity];
                    break;
                }
            }
        }
    }
    [_delegate updateAssortment: assortmentsWithFilter];
}

-(ObjcAssortmentEntity*)getAssortment:(int)index {
    return [assortments objectAtIndex:index];
;
}

-(void)createAssorments {
    assortments = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        ObjcAssortmentEntity *entity = [ObjcAssortmentEntity new];
        entity.title = [[ObjcString alloc] initWith:ObjcStringResoursesTestRecipeTitle].text;
        entity.isFavorite = NO;
        entity.recipeDescription = [[ObjcString alloc] initWith:ObjcStringResoursesTestRecipeDescription].text;
        entity.image = [[ObjcIcons alloc] initWithType:ObjsIconsTomagochiRoll].icon;
        entity.weight = [[WeightEntity alloc] initWithWeight: [[[NSNumber alloc]initWithInt:251] intValue] type:ObjcAssortmentWeightTypeGramm];
        entity.price = [[Price alloc] initWithPrice:355 promoPrice:395 currency: ObjcPriceCurrencyTypeRuble];
        if (i == 0) {
            entity.category = [[NSArray alloc] initWithObjects: [[ObjcFilter alloc] initWith:ObjcFilterTypePopular], [[ObjcFilter alloc] initWith:ObjcFilterTypeWeRecommend], nil];
            
            entity.additionalInfo = [
                NSArray arrayWithObjects:
                [[AdditionalInfo alloc] initWithName: [[ObjcString alloc] initWith:ObjcStringResoursesTestAdditionalInfo1].text color:UIColor.orangeColor],
                [[AdditionalInfo alloc] initWithName: [[ObjcString alloc] initWith:ObjcStringResoursesTestAdditionalInfo2].text color:UIColor.redColor],
                [[AdditionalInfo alloc] initWithName: [[ObjcString alloc] initWith:ObjcStringResoursesTestAdditionalInfo1].text color:UIColor.orangeColor],
                [[AdditionalInfo alloc] initWithName: [[ObjcString alloc] initWith:ObjcStringResoursesTestAdditionalInfo2].text color:UIColor.redColor],
                [[AdditionalInfo alloc] initWithName: [[ObjcString alloc] initWith:ObjcStringResoursesTestAdditionalInfo1].text color:UIColor.orangeColor],
                [[AdditionalInfo alloc] initWithName: [[ObjcString alloc] initWith:ObjcStringResoursesTestAdditionalInfo2].text color:UIColor.redColor],
                nil
            ];
        } else if (i == 1) {
            entity.title = @"Pizza";
            entity.category = [[NSArray alloc] initWithObjects: [[ObjcFilter alloc] initWith:ObjcFilterTypeJapaneseFood], [[ObjcFilter alloc] initWith:ObjcFilterTypeWeRecommend], nil];
        } else if (i == 2) {
            entity.category = [[NSArray alloc] initWithObjects: [[ObjcFilter alloc] initWith:ObjcFilterTypePopular], [[ObjcFilter alloc] initWith:ObjcFilterTypeWeRecommend], nil];
        } else {
            entity.category = [
                [NSArray alloc] initWithObjects:
                [[ObjcFilter alloc] initWith:ObjcFilterTypePopular],
                [[ObjcFilter alloc] initWith:ObjcFilterTypeJapaneseFood],
                [[ObjcFilter alloc] initWith:ObjcFilterTypeWeRecommend],
                nil];
        }
        [assortments addObject:entity];
    }
}

-(void)filtering:(NSString*)text {
    if (text == nil || [text  isEqual: @""]) {
        [_delegate updateAssortment: assortments];
    } else {
        NSMutableArray *assortmentsWithFilter = [NSMutableArray new];
        for (int i = 0; i < assortments.count; i++) {
            ObjcAssortmentEntity *assorment = assortments[i];
            if ([assorment.title containsString:text]) {
                [assortmentsWithFilter addObject:assorment];
            }
        }
        [_delegate updateAssortment: assortmentsWithFilter];
    }
}

@end
