//
//  Asado.m
//  asadoManager
//
//  Created by blusa-desarrollo on 12/13/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import "Asado.h"

@implementation Asado

- (Asado *) init
{
    self = [super init];
    
    if (self)
    {
        self.personas = [[NSMutableArray alloc]init];
        self.c_total = 0;
        self.c_individual = 0;
    }
    
    return self;
}

- (void) agregarPersona:(Persona *)persona
{
    [self.personas insertObject:persona atIndex:0];;
}

- (void) borrarAnteriores{
    self.c_individual = 0;
    self.c_total = 0;
    for (Persona *p in self.personas) {
        if (p.paga_a.count != 0)
        {
            [p.paga_a removeAllObjects];
        }
    }
}
@end
