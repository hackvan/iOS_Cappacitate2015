//
//  ContactTableViewCell.h
//  ParseStarterProject
//
//  Created by dcamacho on 18/04/15.
//
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UIButton *telefono;
- (IBAction)llamarContacto:(UIButton *)sender;

@end
