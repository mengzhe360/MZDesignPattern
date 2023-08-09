//
//  MZNotificationAbstract.h
//  设计模式
//
//  Created by 孟哲 on 2020/2/28.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZMsgSenderProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,MZNotificationEmergencyLevel) {
    SEVERE,//（严重）
    URGENCY,//（紧急）
    NORMAL,//（普通）
    TRIVIAL//（无关紧要）
};

@interface MZNotificationAbstract : NSObject

@property (nonatomic,strong) id<MZMsgSenderProtocol> msgSender;

- (instancetype)initWithMsgSender:(id<MZMsgSenderProtocol>) msgSender;

- (void)notify:(NSString *)message level:(MZNotificationEmergencyLevel)level;

@end

NS_ASSUME_NONNULL_END
