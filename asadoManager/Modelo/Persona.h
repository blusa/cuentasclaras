//
//  Persona.h
//  asadoManager
//
//  Created by blusa-desarrollo on 12/12/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic) float pago;
@property (nonatomic) float resto;
@property (nonatomic, strong) NSMutableDictionary *paga_a; //of Persona

- (NSString *)str;
- (NSString *)str_paga_a;
- (float)cmp:(Persona *)persona;
- (Persona *) initWithNombre:(NSString *)nombre withPago:(float)pago;
- (void) cambiarNombre:(NSString *)nombre yPago:(float)pago;
@end
