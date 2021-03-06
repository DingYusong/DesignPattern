//
//  DYSBuilderViewController.m
//  DesignPattern
//
//  Created by DingYusong on 2019/3/8.
//  Copyright © 2019 丁玉松. All rights reserved.
//
/*
  将⼀一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不不同的表示。
 
 
 参与者：
 ・Builder
    为创建一个Product对象的各个部件指定抽象接口。
 ・ConcreteBuilder
    实现Builder的接口以构造和装配该产品的各个部件。
    定义并明确他所创建的表示
    提供一个检索产品的接口
 ・Director
    构造一个使用Builder的接口
 ・Product
    被构造的复杂对象
    含定义组成部件的类，包括将这些部件装配成最终产品的接口
 
 协作：
 ・客户创建Director对象，并⽤用它所想要的Builder对象进⾏行行
 ・⼀一旦产品部件被⽣生成，导向器器就会通知
 ・⽣生成器器处理理导向器器的请求，并将部件添加到该
 ・客户从⽣生成器器中检索
 
 */
#import "DYSBuilderViewController.h"

#import "DYSFatPersonBuilder.h"
#import "DYSPersonBuilderDirector.h"
#import "DYSThinPersonBuilder.h"

@interface DYSBuilderViewController ()

@end

@implementation DYSBuilderViewController
/**
 场景：画人，人有胖瘦之分（头，身子，左胳膊，右胳膊，左腿，右腿）六个元素不能少。
 
 分析：画人可以分为画（头，身子，左胳膊，右胳膊，左腿，右腿）六部分，这个流程是确定的，每个部分因人的胖瘦是有差异的
 
 实现：一个抽象创建类，确定创建六个部分，胖人创建类和瘦人创建类继承创建类，复写创建部分。一个流程控制类，确定创建流程的每一步，完成创建。（这种场景可使用建造者模式）
 
 创建者模式：一个复杂对象的创建和他的表示分离，同样的创建过程可以创建不同的表示。
 
 新增一种类型的人，只需要增加一个创建类，符合开闭原则。
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self demo01];
}

- (void)demo01 {
    DYSPersonBuilderDirector *director = [DYSPersonBuilderDirector new];
    DYSPersonBuilder *builder = [DYSThinPersonBuilder new];
    director.personBuilder = builder;
    [director createPerson];
    
    builder = [DYSFatPersonBuilder new];
    director.personBuilder = builder;
    [director createPerson];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
