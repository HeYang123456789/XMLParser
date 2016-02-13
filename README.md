# XMLParser
A convenient and nonintrusive XML parser utility for iOS and OSX , based on Apple's NSXMLParser.

###建议直接使用XMLParser_3里面的工具类，XMLParser_1和XMLParser_2可以用于对比学习。

## XMLParser_1
#### 使用了协议方法对客户端自由选择字典转模型的方法，比如可以用KVC或者MJExtension

## XMLParser_2
#### 直接将KVC封装在内部，不需要对外提供协议，直接将在解析XML的SAX解析的过程中装模型，完全与模型解耦

## XMLParser_3 <终极版，最方便，建议直接用>
#### 在XMLParser_2的基础上，使用Block对外提供传入字典转模型方式的参数，相比XMLParser_1采用协议方法简单多了。


##Use  HYXMLParse to Parser XML data
	

```objc
// need Model Class Name(VideoMolel) and XML ChildElementName(video)
//1、创建HYXMLParse对象，
//参数：1、Model Class Name
//     2、XML 需要解析的节点的名 video
//     3、通过block传递字典转模型的方法 ---> 根据实际需求，可以用KVC也可以用MJExtension
HYXMLParser* parser = [[HYXMLParser alloc] initWithModelClassName:@"VideoModel" withElementName:@"video" modelFromBlock:^(NSDictionary<NSString *,NSString *> *dataDic, id model) {
	// 第一种字典转模型：KVC
	// [model setValuesForKeysWithDictionary:dataDic];
	// 第二种字典转模型：MJExtension
	[model mj_setKeyValues:dataDic];
}];
    
//NSData -> NSMutableArray of models
NSMutableArray* models = [parser modelsArrayFromData:data];
```

###The mdels is you want ,That OK!
