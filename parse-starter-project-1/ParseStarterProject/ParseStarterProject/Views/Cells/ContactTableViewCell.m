//
//  ContactTableViewCell.m
//  ParseStarterProject
//
//  Created by dcamacho on 18/04/15.
//
//

#import "ContactTableViewCell.h"

@implementation ContactTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)llamarContacto:(UIButton *)sender {
    NSLog(@"LLamando a %@", sender.titleLabel.text);
    sender.selected = YES;
}
@end
