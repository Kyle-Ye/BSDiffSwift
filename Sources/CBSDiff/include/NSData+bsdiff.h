#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (bsdiff)

+ (BOOL)createDiffWithOldFile:(NSString *)oldFile newFile:(NSString *)newFile patchFile:(NSString *)patchFile;
+ (BOOL)applyWithOldFile:(NSString *)oldFile patchFile:(NSString *)patchFile newFile:(NSString *)newFile;
- (nullable NSData *)patch:(NSData *)patch;
@end

NS_ASSUME_NONNULL_END
