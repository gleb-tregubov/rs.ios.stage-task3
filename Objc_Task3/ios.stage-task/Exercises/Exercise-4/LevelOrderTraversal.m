#import "LevelOrderTraversal.h"

@interface Tree : NSObject

@property(nonatomic)NSNumber *value;
@property(nonatomic)int level;
@property(nonatomic, nullable)Tree *left;
@property(nonatomic, nullable)Tree *right;

- (Tree *)createTree:(NSMutableArray *)treeArray andLevel:(int)level;
- (void)returnNodesArray: (NSMutableDictionary *_Nonnull*_Nonnull)dict;

@end

@implementation Tree


- (instancetype)initWithValue:(NSNumber *)value{
    self = [super init];
    
    if (self){
        self.value = value;
        self.level = 0;
        self.left = nil;
        self.right = nil;
    }

    return self;
}


- (Tree *)createTree:(NSMutableArray *)treeArray andLevel:(int)level{

    if([treeArray count] == 0){
        return nil;
    }else if(treeArray[0] == [NSNull null]){
        
        [treeArray removeObjectAtIndex:0];
        return nil;
    }else{
        
        Tree *root = [[Tree alloc] initWithValue:treeArray[0]];
        root.level += level;
        
        [treeArray removeObjectAtIndex:0];
        
        root.left = [root createTree:treeArray andLevel:root.level + 1];
        
        root.right = [root createTree:treeArray andLevel:root.level + 1];
        
        return root;
    }
}

- (void)returnNodesArray: (NSMutableDictionary **)dict{
    NSMutableDictionary *mutDict = *dict;
    NSString *key = [[NSString alloc] initWithFormat:@"%d", self.level];
    if (mutDict[key]){
        [mutDict[key] addObject:self.value];
    }else{
        mutDict[key] = [[NSMutableArray alloc] initWithObjects:self.value, nil];
    }
    
    if( self.left != nil){
        [self.left returnNodesArray:dict];
    }
    if(self.right != nil){
        [self.right returnNodesArray:dict];
        
    }
}


@end

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableDictionary *resultDict = [NSMutableDictionary new];
    NSMutableArray *resultArray = [NSMutableArray new];

    Tree *myTree = [[Tree alloc] createTree:[tree mutableCopy] andLevel:0];
    [myTree returnNodesArray:&resultDict];
    
    for (int i = 0; i < [resultDict count]; i++) {
        NSString *key = [[NSString alloc] initWithFormat:@"%d",i];
        [resultArray addObject:resultDict[key]];
    }

    return resultArray;
}
