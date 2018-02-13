//
//  ExampleTableViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/9.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "ExampleTableViewController.h"

@interface ExampleTableViewController ()

@property (nonatomic, strong) NSArray *titles;
@property(nonatomic, strong) NSDictionary *exampleDict;

@end

@implementation ExampleTableViewController

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = @[@"RACSignal",
                    @"RACDisposable",
                    @"RACSubject",
                    @"RACReplaySubject",
                    @"RACSequence",
                    @"DevelopSkill",
                    @"Lift",
                    @"RACMulticastConnection",
                    @"RACCommand",
                    @"Bind",
                    @"Map",
                    @"ZipMerge",
                    @"ProFilter"
                    ];
    }
    return _titles;
}

- (NSDictionary *)exampleDict {
    if (!_exampleDict) {
        _exampleDict = @{@"RACSignal": @"RACSignalViewController",
                         @"RACDisposable": @"RACDisposableViewController",
                         @"RACSubject": @"RACSubjectViewController",
                         @"RACReplaySubject": @"RACReplaySubjectViewController",
                         @"RACSequence": @"RACSequenceViewController",
                         @"DevelopSkill": @"DevelopSkillViewController",
                         @"Lift": @"LiftViewController",
                         @"RACMulticastConnection": @"RACMulticastConnectionViewController",
                         @"RACCommand": @"RACCommandViewController",
                         @"Bind": @"BindViewController",
                         @"Map": @"MapViewController",
                         @"ZipMerge": @"ZipMergeViewController",
                         @"ProFilter": @"ProFilterViewController",
                         };
    }
    return _exampleDict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titles.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *const cellIdentifier = @"exampleCell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier];
     }
     cell.textLabel.text = self.titles[indexPath.row];
     return cell;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.titles[indexPath.row];
    NSString *controllerName = self.exampleDict[key];
    
    Class controllerClass = NSClassFromString(controllerName);
    UIViewController *viewController = [[controllerClass alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
