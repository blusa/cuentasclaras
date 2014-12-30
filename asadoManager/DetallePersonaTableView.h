//
//  DetallePersonaTableView.h
//  asadoManager
//
//  Created by blusa-desarrollo on 12/13/14.
//  Copyright (c) 2014 TPC Ideas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetallePersonaTableView : UITableViewController
@property (nonatomic, strong) id idPersonaDetalle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNombre;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPago;
@property (weak, nonatomic) IBOutlet UITextView *textViewPagaA;

- (void) setIdPersonaDetalle:(id)idPersonaDetalle;
@end
