//
//  ContactListTableViewController.m
//  ParseStarterProject
//
//  Created by dcamacho on 18/04/15.
//
//

#import "ContactListTableViewController.h"
#import "ContactTableViewCell.h"
#import <Parse/Parse.h>

@interface ContactListTableViewController ()

@end

@implementation ContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self obtenerContactos];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor purpleColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                         action:@selector(obtenerContactos)
                         forControlEvents:UIControlEventValueChanged];
    
}

- (void)obtenerContactos{
    arreglo = @[@"Grupo Numero 1"];
    arregloDinamico = [[NSMutableArray alloc] init];
    PFQuery *consulta = [PFQuery queryWithClassName:@"Usuario"];
    [consulta findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
            tmpArray = [NSMutableArray arrayWithArray:objects];
            arregloDinamico = tmpArray;
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
            /*
             // The find succeeded.
             NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
             // Do something with the found objects
             for (PFObject *object in objects) {
             NSLog(@"%@", object.objectId);
             }
             */
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * vistaHeader = [[UIView alloc] init];
    vistaHeader.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 10);
    vistaHeader.backgroundColor = [UIColor colorWithRed:61.0f/255 green:150.0f/255 blue:200.0f/255 alpha:1];
    UILabel * titulo = [[UILabel alloc] init];
    titulo.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 40);
    titulo.textColor = [UIColor whiteColor];
    if ([arreglo[section] isKindOfClass:[NSString class]]){
        titulo.text = [NSString stringWithFormat:@"%@", arreglo[section]];
    }
    [vistaHeader addSubview:titulo];
    return vistaHeader;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return arreglo.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0){
        return arregloDinamico.count;
    } else {
        return 5;
    }
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

///*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PFObject * usuario = [arregloDinamico objectAtIndex:indexPath.row];
    
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomContactCellIdentifier"];
    
    cell.nombre.text = [NSString stringWithFormat:@"%@ %@", [usuario objectForKey:@"nombre"],[usuario objectForKey:@"apellido"]];
    
    [cell.telefono setTitle:[NSString stringWithFormat:@"%@", [usuario objectForKey:@"telefono"]] forState:UIControlStateNormal];
    [cell.telefono setTitle:@"Llamando"forState:UIControlStateSelected];
    [cell.telefono setTitle:@"Manten presionado para llamar" forState:UIControlStateHighlighted];
    
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellIdentifier" forIndexPath:indexPath];
    // Configure the cell...
    if (indexPath.section == 0){
        PFObject *usuario = [arregloDinamico objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [usuario objectForKey:@"nombre"], [usuario objectForKey:@"apellido"]];
    } else {
        cell.textLabel.text = @"testing Grupo 2";
    }
    */
    return cell;
}
//*/

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"DetailsSegue" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailsSegue"]){
    }
}

@end
