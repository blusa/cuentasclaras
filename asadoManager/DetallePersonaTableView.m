//
//  DetallePersonaTableView.m
//  asadoManager
//
//  Created by blusa-desarrollo on 12/13/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import "DetallePersonaTableView.h"
#import "MasterViewController.h"
#import "Persona.h"

@interface DetallePersonaTableView()
@property (strong, nonatomic) Persona *persona;

@end

@implementation DetallePersonaTableView
- (Persona *) persona
{
    if (!_persona) _persona = [[Persona alloc]initWithNombre:@"" withPago:0];
    return _persona;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self configurarView];
}


-(void)setIdPersonaDetalle:(id)idPersonaDetalle
{
    if (_idPersonaDetalle != idPersonaDetalle)
        _idPersonaDetalle = idPersonaDetalle;
}

- (void) configurarView
{
    if (self.idPersonaDetalle)
    {
        self.persona = self.idPersonaDetalle;
        [self.textFieldNombre setText:self.persona.nombre];
        [self.textFieldPago setText:[NSString stringWithFormat:@"%.2f", self.persona.pago]];
        [self.textViewPagaA setText:[self.persona str_paga_a]];
    }
    
}
- (IBAction)guardarCambiosButtonPressed:(id)sender
{
    if (self.textFieldPago != nil && self.textFieldNombre != nil)
    {
        [self.persona cambiarNombre:self.textFieldNombre.text yPago:[self.textFieldPago.text floatValue]];
        [self.navigationController popToRootViewControllerAnimated:TRUE];
    }
}


@end
