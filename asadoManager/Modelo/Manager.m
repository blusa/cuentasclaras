//
//  Manager.m
//  asadoManager
//
//  Created by blusa-desarrollo on 12/13/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import "Manager.h"

@implementation Manager

- (Manager *) initWithAsado:(Asado *)asado
{
    self = [super init];
    if (self)
        self.asado = asado;
    return self;
}

- (void) calcular{
    
    // todo :: if ! self.asado.personas -> RAISE EXCEPTION NO HAY PERSONAS

    // calculamos los costos
    self.asado.c_total = self.costoTotal;
    self.asado.c_individual = self.costoIndividual;
    
    // dividimos entre los que van a cobrar y los que van a pagar
    NSMutableArray *cobran  = [[NSMutableArray alloc]init];
    NSMutableArray *pagan  = [[NSMutableArray alloc]init];
    
    for (Persona *p in self.asado.personas)
    {
        p.resto = self.asado.c_individual - p.pago;
        if (p.resto < 0)
        {
            [cobran addObject:p];
        }
        else if (p.resto > 0)
        {
            [pagan addObject:p];
        }
    }
    
    // todo :: if ! cobran && ! pagan  -> RAISE EXCEPTION NADIE DEBE
    
    //[cobran sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //[pagan sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    int per = 0;
    float plata = 0;
    for (Persona *cobra in cobran)
    {
        while (cobra.resto != 0 && per < pagan.count) {
            Persona *paga = [pagan objectAtIndex:per];
            if (paga.resto <= fabsf(cobra.resto))
            {
                if (paga.resto <= self.asado.c_individual)
                {
                    cobra.resto += paga.resto;
                    plata = paga.resto;
                    paga.resto = 0;
                }
                else if (paga.resto <= self.asado.c_individual)
                {
                    cobra.resto += self.asado.c_individual;
                    paga.resto -= self.asado.c_individual;
                    plata = self.asado.c_individual;
                }
            }
            else if (paga.resto >= fabsf(cobra.resto))
            {
                paga.resto += cobra.resto;
                plata = fabsf(cobra.resto);
                cobra.resto = 0;
            }
            [paga.paga_a setValue:[NSNumber numberWithFloat:plata] forKey:cobra.nombre];
            if (paga.resto == 0)
                per +=1;
        }
    }
    
    
}
- (NSString *) imprimirInfo{
    NSMutableString *buf = [NSMutableString stringWithString:@""];
    for (Persona *p in self.asado.personas)
    {
        for (NSString *cobra in [p.paga_a allKeys])
        {
            NSString *fila =[NSString stringWithFormat:@"%@ paga a %@ = %.02f\n", p.nombre, cobra, [[p.paga_a objectForKey:cobra] floatValue]];
            [buf appendString:fila];
        }
    }
    return [NSString stringWithString:buf];
}
- (float) costoTotal{
    float sum = 0;
    for (Persona *p in self.asado.personas)
    {
        sum += p.pago;
    }
    return sum;
}
- (float) costoIndividual{
    return self.asado.c_total / self.asado.personas.count;
}
@end
