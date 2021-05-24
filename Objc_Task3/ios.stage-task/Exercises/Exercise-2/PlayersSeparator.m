#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSInteger firstPlayer;
    NSInteger secondPlayer;
    NSInteger thirdPlayer;
    NSInteger ans = 0;
    
    for (int i = 0; i < ratingArray.count; i++) { // Смотрим первый индекс
        
        firstPlayer = [ratingArray[i] integerValue]; // Заносим первого игрока
        
        for (int j = i + 1; j < ratingArray.count; j++) { // Запускаем воторой обход начиная со следующего игрока
            
            if ( [ratingArray[i] integerValue] < [ratingArray[j] integerValue] || [ratingArray[i] integerValue] > [ratingArray[j] integerValue]) { // Если Счет второго больше счета первого игрока, у нас получается строить комбинацию
                                                    // И работаем дальше
                secondPlayer = [ratingArray[j] integerValue]; // Заносим второго игрока
                
                for (int k = j + 1; k < ratingArray.count; k++) { // Запускаем третий обход со следующего за вторым игроком что бы найти последнего
                    
                    if (
                        ( ([ratingArray[j] integerValue] < [ratingArray[k] integerValue]) &&
                        ([ratingArray[i] integerValue] < [ratingArray[j] integerValue]) ) ||
                        ( ([ratingArray[j] integerValue] > [ratingArray[k] integerValue]) &&
                        ([ratingArray[i] integerValue] > [ratingArray[j] integerValue]) )
                        ) {
                        thirdPlayer = [ratingArray[k] integerValue];
                        ans++;
//                        break;
                    }
                    
                }
                
            }
            
        }
        
    }
    
    NSLog(@"%ld", (long)ans);
    return ans;
}

@end
