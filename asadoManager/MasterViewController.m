//
//  MasterViewController.m
//  asadoManager
//
//  Created by blusa-desarrollo on 12/12/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import "MasterViewController.h"
#import "DetallePersonaTableView.h"
#import "Manager.h"
#import "Persona.h"

@interface MasterViewController ()
@property (nonatomic) int counterPersona;
@property (nonatomic, strong) Asado *asado;
@property (nonatomic, strong) Manager *manager;
@property (nonatomic, strong) NSMutableArray *objects;
@end

@implementation MasterViewController
- (Asado *) asado
{
    if (!_asado) _asado = [[Asado alloc] init];
    return _asado;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIBarButtonItem *calcularButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(calcularAsado)];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    
    self.navigationItem.leftBarButtonItem = calcularButton;
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void) calcularAsado
{
    if (self.asado)
    {
        [self.asado borrarAnteriores];
        Manager *manager = [[Manager alloc] initWithAsado:self.asado];
        [manager calcular];
        NSString *resultados;
        if (![[manager imprimirInfo]  isEqual: @""])
        {
            resultados = [NSString stringWithFormat:@"Total $%.02f \n Individual $%.02f \n\n %@", self.asado.c_total, self.asado.c_individual,[manager imprimirInfo]];
        }else{
            resultados = [NSString stringWithFormat:@"Nada que calcular"];
            
        }
        UIAlertView* resultadosView = [[UIAlertView alloc]
                                       initWithTitle:@"Resultados"
                                       message:resultados
                                       delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:@"Agregar Fotos", @"Guardar", nil];
        
        [resultadosView show];

    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // agregar foto
    if (buttonIndex == 1) {

    }
    // guardar
    else if (buttonIndex == 2)
    {
        
    }
}

- (void)insertNewObject:(id)sender {
    Persona *nuevaPersona = [[Persona alloc] initWithNombre:[NSString stringWithFormat:@"%@_%d",@"Persona", _counterPersona] withPago:0];
    self.counterPersona++;
    [self.asado agregarPersona:nuevaPersona];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Persona *object = self.asado.personas[indexPath.row];
        [[segue destinationViewController] setIdPersonaDetalle:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.asado.personas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Persona *object = self.asado.personas[indexPath.row];
    cell.textLabel.text = [object str];
    return cell;
}

@end
