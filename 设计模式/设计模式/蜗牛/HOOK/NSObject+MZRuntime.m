//
//  NSObject+MZRuntime.m
//  设计模式
//
//  Created by A5 on 2020/1/14.
//  Copyright © 2020 孟哲. All rights reserved.
//

#import "NSObject+MZRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (MZRuntime)

/* 获取对象的所有属性 */
+(NSArray *)getAllProperties
{
    u_int count;
    // 传递count的地址过去 &count
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    //arrayWithCapacity的效率稍微高那么一丢丢
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++){
        //此刻得到的propertyName为c语言的字符串
        const char* propertyName =property_getName(properties[i]);
        //此步骤把c语言的字符串转换为OC的NSString
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    //class_copyPropertyList底层为C语言，所以我们一定要记得释放properties
    // You must free the array with free().
    free(properties);
    
    return propertiesArray;
}

/* 获取对象的所有方法 */
+(NSArray *)getAllMethods
{
    unsigned int methodCount =0;
    Method* methodList = class_copyMethodList([self class],&methodCount);
    NSMutableArray *methodsArray = [NSMutableArray arrayWithCapacity:methodCount];
    
    for(int i=0;i<methodCount;i++)
    {
        Method temp = methodList[i];
//        IMP imp = method_getImplementation(temp);
//        SEL name_f = method_getName(temp);
        const char* name_s =sel_getName(method_getName(temp));
        int arguments = method_getNumberOfArguments(temp);
        const char* encoding =method_getTypeEncoding(temp);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,
              [NSString stringWithUTF8String:encoding]);
        [methodsArray addObject:[NSString stringWithUTF8String:name_s]];
    }
    free(methodList);
    return methodsArray;
}

/* 获取对象的所有属性和属性内容 */
+ (NSDictionary *)getAllPropertiesAndVaules:(NSObject *)obj
{
    NSMutableDictionary *propsMDict = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t *properties =class_copyPropertyList([obj class], &outCount);
    for ( int i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [obj valueForKey:(NSString *)propertyName];
        if (propertyValue) {
            [propsMDict setObject:propertyValue forKey:propertyName];
        }
    }
    free(properties);
    return propsMDict.copy;
}

@end


