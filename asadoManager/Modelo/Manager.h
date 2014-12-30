//
//  Manager.h
//  asadoManager
//
//  Created by blusa-desarrollo on 12/13/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Asado.h"
@interface Manager : NSObject
@property (nonatomic, strong) Asado *asado;
- (Manager *) initWithAsado:(Asado *)asado;
- (void) calcular;
- (NSString *) imprimirInfo;
- (float) costoTotal;
- (float) costoIndividual;
@end
