//
//  DeviceDisk.m
//  PoporUI
//
//  Created by popor on 2018/6/19.
//  Copyright © 2018年 popor. All rights reserved.
//

#import "DeviceDisk.h"

#include <sys/param.h>
#include <sys/mount.h>
#include <sys/types.h>
#include <sys/sysctl.h>


@implementation DeviceDisk

#pragma mark [获取设备版本号]
+ (NSString *)getDeviceNormalPlatform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

+ (long long)getAvailableMemorySize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return freeSpace;
}

+ (NSString *)getHumanSize:(float)fileSizeFloat {
    if (fileSizeFloat<1048576.0f) {
        return [NSString stringWithFormat:@"%.02fKB", fileSizeFloat/1024.0f];
    }else if(fileSizeFloat<1073741824.0f) {
        return [NSString stringWithFormat:@"%.02fMB", fileSizeFloat/1048576.0f];
    }else {
        return [NSString stringWithFormat:@"%.02fGB", fileSizeFloat/1073741824.0f];
    }
    // end.
}


@end
