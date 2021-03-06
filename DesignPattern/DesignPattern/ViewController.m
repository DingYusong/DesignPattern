//
//  ViewController.m
//  DesignPattern
//
//  Created by 丁玉松 on 2018/12/28.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSourceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设计模式";
    self.dataSourceArray = @[
        @{
            @"title": @"设计模式基本原则",
            @"array": @[
                    @{
                        @"title": @"单一职责原则",
                        @"page": @"DYSRule01ViewController"
                    },
                ]
        },
        @{
            @"title": @"对象创建",
            @"array": @[
                    @{
                        @"title": @"简单工厂-SimpleFactory",
                        @"page": @"DYSSimpleFactoryViewController"
                        },
                    @{
                        @"title": @"工厂方法-FactoryMethod",
                        @"page": @"DYSFactoryMethodViewController"
                        },
                    @{
                        @"title": @"抽象工厂-AbstractFactory",
                        @"page": @"DYSAbstractFactoryViewController"
                        },

                @{
                   @"title": @"原型-Prototype",
                   @"page": @"DYSPrototypeViewController"
                },
                @{
                   @"title": @"生成器/建造者-Builder",
                   @"page": @"DYSBuilderViewController"
                },
                @{
                   @"title": @"单例-Singleton",
                   @"page": @"DYSSingletonViewController"
                },
            ]
        },
        @{
            @"title": @"接口适配",
            @"array": @[
                @{
                   @"title": @"适配器-Adapter",
                   @"page": @"DYSAdapterViewController"
                },
                @{
                   @"title": @"桥接-Bridge",
                   @"page": @"DYSBridgeViewController"
                },
                @{
                   @"title": @"外观-Facade",
                   @"page": @"DYSFacadeViewController"
                },
            ]
        },
        @{
            @"title": @"对象去耦合",
            @"array": @[
                @{
                   @"title": @"中介者-Mediator",
                   @"page": @"DYSMediatorViewController"
                },
                @{
                   @"title": @"观察者-Observer",
                   @"page": @"DYSObserverViewController"
                },
            ]
        },
        @{
            @"title": @"抽象集合",
            @"array": @[
                @{
                   @"title": @"组合-Composite",
                   @"page": @"DYSCompositeViewController"
                },
                @{
                   @"title": @"迭代器-Iterator",
                   @"page": @"DYSIteratorViewController"
                },
            ]
        },
        @{
            @"title": @"行为扩展",
            @"array": @[
                    @{
                        @"title": @"解释器-Interpreter",
                        @"page": @"DYSInterpreterViewController"
                        },
                @{
                   @"title": @"访问者-Visitor",
                   @"page": @"DYSVisitorViewController"
                },
                @{
                   @"title": @"装饰器-Decorator",
                   @"page": @"DYSDecoratorViewController"
                },
                @{
                   @"title": @"责任链-ResponseChain",
                   @"page": @"DYSResponseChainViewController"
                },
            ]
        },
        @{
            @"title": @"算法封装",
            @"array": @[
                @{
                   @"title": @"模板方法-Template",
                   @"page": @"DYSTemplateViewController"
                },
                @{
                   @"title": @"策略-Strategy",
                   @"page": @"DYSStrategyViewController"
                },
                @{
                   @"title": @"命令-Command",
                   @"page": @"DYSCommandViewController"
                },
            ]
        },
        @{
            @"title": @"性能与访问对象",
            @"array": @[
                @{
                   @"title": @"享元-Flyweight",
                   @"page": @"DYSFlyweightViewController"
                },
                @{
                   @"title": @"代理-Proxy",
                   @"page": @"DYSProxyViewController"
                },
            ]
        },
        @{
            @"title": @"对象状态",
            @"array": @[
                @{
                   @"title": @"备忘录-Memento",
                   @"page": @"DYSMementoViewController"
                },
                @{
                    @"title": @"状态-State",
                    @"page": @"DYSStateViewController"
                    },
            ]
        },
    ];
    self.tableView.rowHeight = 50;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:section];
    NSArray *array = [dict objectForKey:@"array"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }

    NSDictionary *sectionDict = [self.dataSourceArray objectAtIndex:indexPath.section];
    NSArray *array = [sectionDict objectForKey:@"array"];
    NSDictionary *dict = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    
    NSInteger i = 0;
    NSInteger j = 1;
    while (i < indexPath.section) {
        NSDictionary *sectionDict = [self.dataSourceArray objectAtIndex:i];
        NSArray *array = [sectionDict objectForKey:@"array"];
        j += array.count;
        i += 1;
    }
    j += indexPath.row;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",j];
    return cell;
}

#pragma mark - UITableViewDelegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *sectionDict = [self.dataSourceArray objectAtIndex:section];
    NSArray *array = [sectionDict objectForKey:@"array"];

    return [NSString stringWithFormat:@"%@-%ld",[sectionDict objectForKey:@"title"],array.count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *sectionDict = [self.dataSourceArray objectAtIndex:indexPath.section];
    NSArray *array = [sectionDict objectForKey:@"array"];
    NSDictionary *dict = [array objectAtIndex:indexPath.row];

    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
    [self.navigationController pushViewController:vc animated:YES];
    vc.view.backgroundColor = [UIColor whiteColor];
}
@end
