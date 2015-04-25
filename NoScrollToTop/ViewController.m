//
//  ViewController.m
//  NoScrollToTop
//
//  Created by Meet Gupta
//  Projective-C
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) NSArray *days;
@property (nonatomic) NSArray *headers;

@property (nonatomic) UITableView *table1;
@property (nonatomic) UIScrollView *headerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.days = [[NSArray alloc] initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24,@25,@26,@27,@28,@29,@30, nil];
    self.headers = [[NSArray alloc] initWithObjects:@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat",@"Sun", nil];
    
    CGFloat tableOffsetY = 70;
    
    self.headerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), tableOffsetY)];
    self.headerView.backgroundColor = [UIColor blackColor];
    float x = 20;
    float i = 0;
    for (NSString *headerName in self.headers) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x, 20, tableOffsetY, 40);
        btn.tag = 100 + i;
        [btn setTitle:headerName forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.headerView addSubview:btn];
        i++;
        x+= 90;
    }
    self.headerView.contentSize = CGSizeMake(x, tableOffsetY);
    [self.view addSubview:self.headerView];
    
    self.table1 = [[UITableView alloc] initWithFrame:CGRectMake(0, tableOffsetY, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - tableOffsetY) style:UITableViewStylePlain];
    self.table1.dataSource = self;
    self.table1.delegate = self;
    [self.table1 setScrollsToTop:YES];
    self.table1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.table1];
}

- (void)buttonClicked:(UIButton *)senderBtn{
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.days.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *dataStr = [NSString stringWithFormat:@"%@",[self.days objectAtIndex:indexPath.row]];
    NSString *cellId  = @"TableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.textLabel.text = dataStr;
    
    return cell;
    
}

#pragma mark

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end