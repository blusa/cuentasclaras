//
//  Persona.m
//  asadoManager
//
//  Created by blusa-desarrollo on 12/12/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import "Persona.h"

@implementation Persona
-(Persona *) initWithNombre:(NSString *)nombre withPago:(float)pago
{
    self = [super init];
    if (self)
    {
        self.nombre = nombre;
        self.pago = pago;
        self.resto = 0;
        self.paga_a = [[NSMutableDictionary alloc]init];
    }
    return self;
}
- (void) cambiarNombre:(NSString *)nombre yPago:(float)pago
{
    self.nombre = nombre;
    self.pago = pago;
}

- (NSString *)str
{
    return [NSString stringWithFormat:@"%@ pagó: %.02f$", self.nombre, self.pago];
}

- (NSString *)str_paga_a
{
    NSMutableString *buf = [NSMutableString stringWithFormat:@""];
    for (NSString *cobra in [self.paga_a allKeys])
    {
        [buf appendString:[NSString stringWithFormat:@"Paga a %@ $%.02f\n", cobra, [[self.paga_a objectForKey:cobra] floatValue]]];
    }
    return buf;
}

- (float)cmp:(Persona *)persona
{
    if (self.resto < persona.resto)
    {
        return -1;
    }
    else if (self.resto > persona.resto)
    {
        return 1;
    }
    else{
        return 0;
    }
}

@end
