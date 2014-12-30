//
//  Asado.h
//  asadoManager
//
//  Created by blusa-desarrollo on 12/13/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persona.h"
@interface Asado : NSObject
@property (nonatomic, strong) NSMutableArray *personas; //Of Persona
@property (nonatomic) float c_total;
@property (nonatomic) float c_individual;

- (void)agregarPersona:(Persona *)persona;
- (void)borrarAnteriores;
@end
