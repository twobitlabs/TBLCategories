#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

-(void)addConstraintsFromArray:(NSArray*)constraints views:(NSDictionary *)views {
    for (UIView *view in [views allValues]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [self addConstraints:constraints];
}

-(void)addConstraintsFromDescriptions:(NSArray*)constraintDescriptions views:(NSDictionary *)views {
    [self addConstraintsFromDescriptions:constraintDescriptions metrics:nil views:views];
}

-(void)addConstraintsFromDescriptions:(NSArray*)constraintDescriptions metrics:(NSDictionary *)metrics views:(NSDictionary *)views {
    [self addConstraintsFromDescriptions:constraintDescriptions options:0 metrics:metrics views:views];
}

-(void)addConstraintsFromDescriptions:(NSArray*)constraintDescriptions options:(NSLayoutFormatOptions)options metrics:(NSDictionary *)metrics views:(NSDictionary *)views {
    for (UIView *view in [views allValues]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    for (NSString *constraintDescription in constraintDescriptions) {
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintDescription options:options metrics:metrics views:views]];
    }
}

-(void)addSubviews:(NSDictionary *)views constraints:(NSArray*)constraintDescriptions options:(NSLayoutFormatOptions)options metrics:(NSDictionary*)metrics {
    for (UIView *view in [views allValues] ) {
        if (![view conformsToProtocol:@protocol(UILayoutSupport)]) {
            [self addSubview:view];
        }
    }
    [self addConstraintsFromDescriptions:constraintDescriptions
                                 options:options
                                 metrics:metrics
                                   views:views];
}

-(void)addSubview:(UIView *)view containedWithInsets:(UIEdgeInsets)insets {
    NSDictionary *metrics = @{@"top":@(insets.top),
                              @"bottom":@(insets.bottom),
                              @"left":@(insets.left),
                              @"right":@(insets.right),
                              };
    NSDictionary *views = @{@"view":view};
    NSArray *constraints = @[@"V:|-top-[view]-bottom-|",
                             @"H:|-left-[view]-right-|",
                             ];
    [self addSubviews:views
          constraints:constraints
              options:0
              metrics:metrics];
    
}

-(void)centerSibling:(UIView*)sibling1 withSibling:(UIView*)sibling2 {
    [self centerSiblingHorizontally:sibling1 withSibling:sibling2];
    [self centerSiblingVertically:sibling1 withSibling:sibling2];
}

-(void)centerSiblingHorizontally:(UIView*)sibling1 withSibling:(UIView*)sibling2 {
    sibling1.translatesAutoresizingMaskIntoConstraints = NO;
    sibling2.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerHorizontally = [NSLayoutConstraint constraintWithItem:sibling1
                                                                          attribute:NSLayoutAttributeCenterX
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:sibling2
                                                                          attribute:NSLayoutAttributeCenterX
                                                                         multiplier:1 constant:0];
    [self addConstraint:centerHorizontally];
}

-(void)centerSiblingVertically:(UIView*)sibling1 withSibling:(UIView*)sibling2 {
    sibling1.translatesAutoresizingMaskIntoConstraints = NO;
    sibling2.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerVertically = [NSLayoutConstraint constraintWithItem:sibling1
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:sibling2
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1 constant:0];
    [self addConstraint:centerVertically];
}

-(void)centerChild:(UIView *)childView {
    [self centerChildHorizontally:childView];
    [self centerChildVertically:childView];
}

-(void)centerChildHorizontally:(UIView *)childView {
    childView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerHorizontally = [NSLayoutConstraint constraintWithItem:childView
                                                                          attribute:NSLayoutAttributeCenterX
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeCenterX
                                                                         multiplier:1 constant:0];
    [self addConstraint:centerHorizontally];
}

-(void)centerChildVertically:(UIView *)childView {
    childView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerVertically = [NSLayoutConstraint constraintWithItem:childView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1 constant:0];
    [self addConstraint:centerVertically];
}

-(void)alignBaseline:(UIView *)sibling1 withSibling:(UIView *)sibling2 {
    sibling1.translatesAutoresizingMaskIntoConstraints = NO;
    sibling2.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *baselineAlignment = [NSLayoutConstraint constraintWithItem:sibling1
                                                                         attribute:NSLayoutAttributeBaseline
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:sibling2
                                                                         attribute:NSLayoutAttributeBaseline
                                                                        multiplier:1 constant:0];
    [self addConstraint:baselineAlignment];
}

-(CGFloat)aquaSpaceConstantBetweenSiblings {
    static CGFloat value;
    
    if (!isnormal(value)) {
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[view]-[view]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)];
        if ([constraints count] == 1) {
            NSLayoutConstraint *constraint = constraints[0];
            value = constraint.constant;
        } else {
            value = 8.0;
        }
    }
    
    return value;
}

-(CGFloat)aquaSpaceConstantToSuperview {
    static CGFloat value;
    
    if (!isnormal(value)) {
        UIView *view = [UIView new];
        UIView *superview = [UIView new];
        [superview addSubview:view];
        NSArray *constraints =  [NSLayoutConstraint constraintsWithVisualFormat:@"[view]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)];
        if ([constraints count] == 1) {
            NSLayoutConstraint *constraint = constraints[0];
            value = constraint.constant;
        } else {
            value = 20.0;
        }
    }
    return value;
}
@end
