//
//  ViewController.m
//  LLYUICollectionViewWaterFall
//
//  Created by lly on 2017/4/11.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "ViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "LLYCollectionViewWaterFallLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CHTCollectionViewDelegateWaterfallLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;

@end

#define kCellWidth     ([UIScreen mainScreen].bounds.size.width-20)/2

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LLYCollectionViewWaterFallLayout *layout = [[LLYCollectionViewWaterFallLayout alloc]init];
    [self.mCollectionView setCollectionViewLayout:layout];
    [self.mCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 50;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(5, 5, 0, 5);
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    int row = (int)indexPath.row;
//    int index = row%4;
//    CGFloat cellHeight = 100;
//    if (index == 0 || index == 2) {
//        cellHeight = 300;
//    }
//    else if (index == 1 || index == 3){
//        cellHeight = 100;
//    }
//    return CGSizeMake(kCellWidth, cellHeight);
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
