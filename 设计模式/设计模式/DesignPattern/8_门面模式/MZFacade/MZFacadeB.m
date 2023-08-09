//
//  MZFacadeB.m
//  设计模式
//
//  Created by 孟哲 on 2020/1/12.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "MZFacadeB.h"
#import "MZFacadeA.h"

@interface MZFacadeB ()

@property (nonatomic,strong) MZFacadeA *facadeA;

@end

@implementation MZFacadeB

- (void)facadeBmethodD
{
    MZMLog
    _facadeA = [[MZFacadeA alloc] init];
    [_facadeA facadeImageDownloader];
}

@end
