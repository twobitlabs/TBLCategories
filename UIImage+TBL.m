#import "UIImage+TBL.h"

@implementation UIImage (TBL)

+(UIImage *)imageNamed:(NSString *)name ofType:(NSString *)type shouldCache:(BOOL)cache {
    if (cache) return [self imageNamed:name];
    UIImage *image = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    if (path != nil) {
        image = [UIImage imageWithContentsOfFile:path];
    }
#ifdef DEBUG
    // Images in xcassets will not be found by poking around in the mainBundle.
    // shouldCache:NO does not work for images in xcassets and will always
    // return nil.
    if (!image && !cache) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"Image not found.  If the image is in xcassets you must pass shouldCache:YES or use the default [UIImage imageNamed:] method."]
                                     userInfo:nil];
    }
#endif
    return image;
}

@end
