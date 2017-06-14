//
//  applictionMode.m
//  demo2
//
//  Created by MAC on 14/06/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "applictionMode.h"

@implementation applictionMode

+(applictionMode *)sharedapplictionMode{
    
    static applictionMode *shared=nil;
    @synchronized (self) {
        if(!shared){
            shared=[[applictionMode alloc]init];
        }
    }
    return shared;
}

@end
