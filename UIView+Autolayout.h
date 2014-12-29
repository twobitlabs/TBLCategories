#import <UIKit/UIKit.h>

@interface UIView (Autolayout)

/**
 Add the autolayout constraints in the array, disabling `translatesAutoresizingMaskIntoConstraints` on views in dictionary
 */
-(void)addConstraintsFromArray:(NSArray*)constraints views:(NSDictionary *)views;

/**
 Add autolayout constraints
 */
-(void)addConstraintsFromDescriptions:(NSArray*)constraintDescriptions views:(NSDictionary *)views;

/**
 Add autolayout constraints with metrics
 */
-(void)addConstraintsFromDescriptions:(NSArray*)constraintDescriptions metrics:(NSDictionary *)metrics views:(NSDictionary *)views;

/**
 Add autolayout constraints with options
 */
-(void)addConstraintsFromDescriptions:(NSArray*)constraintDescriptions options:(NSLayoutFormatOptions)options metrics:(NSDictionary *)metrics views:(NSDictionary *)views;

/**
 Add subviews and add autolayout constraints
 */
-(void)addSubviews:(NSDictionary *)views constraints:(NSArray*)constraintDescriptions options:(NSLayoutFormatOptions)options metrics:(NSDictionary*)metrics;

/**
 Add a subview, and add constriants so that it's contained within the view using insets provided
 */
-(void)addSubview:(UIView *)view containedWithInsets:(UIEdgeInsets)insets;

/*!
 Add an autolayout constraint centering two sibling child views vertically and horizontally
 */
-(void)centerSibling:(UIView*)sibling1 withSibling:(UIView*)sibling2;

/*!
 Add an autolayout constraint centering two sibling child views horizontally
 */
-(void)centerSiblingHorizontally:(UIView*)sibling1 withSibling:(UIView*)sibling2;

/*!
 Add an autolayout constraint centering two sibling child views vertically
 */
-(void)centerSiblingVertically:(UIView*)sibling1 withSibling:(UIView*)sibling2;

/**
 Add an autolayout constraint centering `childView` vertically and horizontally in the current view
 */
-(void)centerChild:(UIView *)childView;

/**
 Add an autolayout constraint centering `childView` horizontally in the current view
 */
-(void)centerChildHorizontally:(UIView *)childView;

/**
 Add an autolayout constraint centering `childView` vertically in the current view
 */
-(void)centerChildVertically:(UIView *)childView;

/*!
 Add an autolayout constraint vertically aligning two sibling child views on baseline
 */
-(void)alignBaseline:(UIView *)sibling1 withSibling:(UIView *)sibling2;

/*
 Get the standard aqua space (- in visual format) between 2 sibling views
 */
-(CGFloat)aquaSpaceConstantBetweenSiblings;

/*
 Get the standard aqua space (-| in visual format) between 2 a view and its superview
 */
-(CGFloat)aquaSpaceConstantToSuperview;

@end
