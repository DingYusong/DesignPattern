//
//  DYSWebSideProtocol.h
//  DesignPattern
//
//  Created by 丁玉松 on 2019/5/28.
//  Copyright © 2019 丁玉松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYSFWUser.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DYSWebSideProtocol <NSObject>

-(void)use:(DYSFWUser *)user;

@end

NS_ASSUME_NONNULL_END
