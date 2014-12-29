#import "UIButton+TBL.h"
#import <objc/runtime.h>

// This is ayanok's code for setting background color for a state,
// modified from his subclass implementation to be a category instead,
// and using associative objects since instance variables are not permitted in categories.
// A bug in the original code for setBackgroundColor:forState: has been fixed;
// see comment in method implementation.
//
// References:
// http://andycodes.tumblr.com/post/5216556795/uibutton-set-backgroundcolor-for-state
// https://github.com/ayanok/AYUIButton
// http://oleb.net/blog/2011/05/faking-ivars-in-objc-categories-with-associative-references/
// http://stackoverflow.com/questions/11170116/change-button-background-color-when-clicked
// http://blog.ddg.com/?p=59

static char const * const kBackgroundStates = "kBackgroundStates";

@implementation UIButton (TBL)

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    if (self.backgroundStates == nil) {
        self.backgroundStates = [[NSMutableDictionary alloc] init];
    }

    [self.backgroundStates setObject:color forKey:[NSNumber numberWithInt:state]];

    UIColor *backgroundColorForCurrentState = [self backgroundColorForState:self.state];

    // this fixes a bug in the original code by ayanok which only set the background color if it was nil
    // part 2 after || fixes a bug that didn't use UIControlStateNormal's background color as the fallback if no background color had been set for the current UIControlState (it should use UIControlStateNormal's background color as fallback)
    if (self.state == state || (!backgroundColorForCurrentState && state == UIControlStateNormal)) {
        [self setBackgroundColor:color];
    }
}

-(UIColor*)backgroundColorForState:(UIControlState)state {
    return [self.backgroundStates objectForKey:[NSNumber numberWithInt:state]];
}

#pragma mark -
#pragma mark Getter/setter using associated objects

// due to instance variables not permitted for categories

-(id)backgroundStates {
    return objc_getAssociatedObject(self, kBackgroundStates);
}

-(void)setBackgroundStates:(id)newBackgroundStates {
    objc_setAssociatedObject(self, kBackgroundStates, newBackgroundStates, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -
#pragma mark Touches

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    UIColor *selectedColor = [self.backgroundStates objectForKey:[NSNumber numberWithInt:UIControlStateHighlighted]];
    if (selectedColor) {
        self.backgroundColor = selectedColor;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];

    UIColor *normalColor = [self.backgroundStates objectForKey:[NSNumber numberWithInt:UIControlStateNormal]];
    if (normalColor) {
        self.backgroundColor = normalColor;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    CLSLog(@"tapped button \"%@\"", [self titleForState:UIControlStateNormal]);

    UIColor *normalColor = [self.backgroundStates objectForKey:[NSNumber numberWithInt:UIControlStateNormal]];
    if (normalColor) {
        self.backgroundColor = normalColor;
    }
}

@end
