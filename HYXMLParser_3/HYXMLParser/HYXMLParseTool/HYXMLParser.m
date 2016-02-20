
#import "HYXMLParser.h"

@interface HYXMLParser () <NSXMLParserDelegate>

/** NSMutableArray */
@property (nonatomic,strong)NSMutableArray *datas;

/** model name */
@property (nonatomic,strong)NSString *model_name;
/** element name */
@property (nonatomic,strong)NSString *elementName;

/** Block存储字典转模型的方法 */
@property (nonatomic,copy) ModelFromDictionaryBlock modelFromDictionary;

@end

@implementation HYXMLParser

#pragma mark - Create a object

- (instancetype)initWithModelClassName:(NSString*)modelClassName withElementName:(NSString*)elementName modelFromBlock:(ModelFromDictionaryBlock)modelFromDictionary
{
    self = [self init];
    if (self) {
        self.model_name = modelClassName;
        self.elementName = elementName;
        self.modelFromDictionary = modelFromDictionary;
    }
    return self;
}

+(instancetype)hyXMLParseWithModelClassName:(NSString*)modelClassName withElementName:(NSString*)elementName modelFromBlock:(ModelFromDictionaryBlock)modelFromDictionary{
    return [[HYXMLParser alloc] initWithModelClassName:modelClassName withElementName:elementName modelFromBlock:modelFromDictionary];
}

//别忘了重写datas的懒加载方法
-(NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

#pragma mark - parser xml data
/*
 * XML的SAX解析过程：
 * 1、传入XML格式的数据：NSData 2、创建NSXMLParser对象 3、设置代理，并实现代理的相关方法 
 * 4、开始解析，从根元素开始，按顺序一个元素一个元素往下解析 5、返回解析XML后获取的数据对象
 */
-(NSMutableArray*)modelsArrayFromData:(NSData*)data{
    NSXMLParser *parse = [[NSXMLParser alloc] initWithData:data];
    parse.delegate = self;
    [parse parse];
    return self.datas;
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{

    if ([elementName isEqualToString:self.elementName]) {
        
        //通过Objective-C的反射机制，直接用类名来创建模型对象
        id model = [[NSClassFromString(self.model_name) alloc] init];
        
        //将这个字典转为模型，然后赋值给模型数组
        self.modelFromDictionary(attributeDict,model);
        [self.datas addObject:model];
    }
    return;
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
}

@end
