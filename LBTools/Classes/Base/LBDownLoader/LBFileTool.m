//
//  LBFileTool.m
//  LBDownLoadListern
//
//  Created by 张伯林 on 2017/11/30.
//  Copyright © 2017年 张伯林. All rights reserved.
//

#import "LBFileTool.h"

@implementation LBFileTool
+(BOOL)fileExists:(NSString *)filePath{
    if (filePath.length == 0) {
        return NO;
    }
    return [[NSFileManager defaultManager]fileExistsAtPath:filePath];
}

+(long long)fileSize:(NSString *)filePath{
    if (![self fileExists:filePath]) {
        return 0;
    }
   NSDictionary *fileInfo = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    
    return [fileInfo[NSFileSize] longLongValue];
}

+(void)moveFile:(NSString *)fromPath toPath:(NSString *)toPath{
    
    if (![self fileSize:fromPath]) {
        return;
    }
    [[NSFileManager defaultManager] moveItemAtPath:fromPath toPath:toPath error:nil];
}

+(void)removeFile:(NSString *)filePath{
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}
@end
