/* http://stackoverflow.com/a/22289371
 * http://apple.stackexchange.com/a/123738/72534
 */
#import <objc/runtime.h>
#import <Foundation/Foundation.h>

int main () {
    NSBundle *bundle = [NSBundle bundleWithPath:@"/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu"];

    Class principalClass = [bundle principalClass];

    id instance = [[principalClass alloc] init];

    [instance performSelector:@selector(_lockScreenMenuHit:) withObject:nil];

    return 0;
}
