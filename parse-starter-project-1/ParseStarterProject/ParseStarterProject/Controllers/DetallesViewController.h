//
//  DetallesViewController.h
//  ParseStarterProject
//
//  Created by dcamacho on 18/04/15.
//
//

#import <UIKit/UIKit.h>

@interface DetallesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagen;
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UIButton *telefono;
//- (IBAction)llamar:(id)sender;
@property (nonatomic, weak) NSDictionary * usuario;
@end
