![](http://img.hoop8.com/attachments/1512/0342032228343.png)


HYXMLParser_two
===
- A convenient and nonintrusive XML parser utility for iOS and OSX , based on Apple's NSXMLParser.

- 基于Apple的NSXMLParser的使用简单方便的XML解析工具

GitHub：[HeYang](https://github.com/HeYang123456789) ｜ Blog：[HeYang(Chinese)](http://www.cnblogs.com/goodboy-heyang/)

## Contents
* [Getting Started 【开始使用】](#Getting_Started)
* [Examples 【示例】](#Examples)

# <a id="Getting_Started"></a> Getting Started 【开始使用】


### Manually【手动导入】
- Drag all source files under floder `HYXMLParserTool` to your project.【将`HYXMLParserTool`文件夹中的所有源代码拽入项目中】
- Import the main header file：`#import "HYXMLParser.h"`【导入主头文件：`#import "HYXMLParser.h"`】

```objc
HYXMLParser.h				HYXMLParser.m
```

* My Example Project has this primar files:

```	
HYXMLParser.h				HYXMLParser.m
VideoModel.h				VideoModel.m
data.xml
```

* the 'data.xml' for example:

```
<?xml version="1.0" encoding="UTF-8"?>
<videos>
	<video id="1" name="小黄人 第01部" length="10" image="resources/images/minion_01.png" url="resources/videos/minion_01.mp4" />
	<video id="2" name="小黄人 第02部" length="12" image="resources/images/minion_02.png" url="resources/videos/minion_02.mp4" />
		
		.....
		.....

</videos>

```

# <a id="Examples"></a> Examples【示例】

#### NSData of XML --> NSMutableArray of Models【将XML的NSData转为模型数组】



* 1、In 'VideoModel.h' and 'VideoModel.m'
	在模型类中实现协议的方法，字典转模型
		
	```objc
	
	#import <Foundation/Foundation.h>

	@interface VideoModel : NSObject

	/** image */
	@property (nonatomic,strong)NSString *image;
	/** name */
	@property (nonatomic,strong)NSString *name;
	/** url */
	@property (nonatomic,strong)NSString *url;
	/** length */
	@property (nonatomic,strong)NSNumber *length;
	/** id */
	@property (nonatomic,strong)NSNumber *id;

	@end
	```
	
* 2、Use  HYXMLParse to Parser XML data
	

	```objc
	
	// need Model Class Name(VideoMolel) and XML ChildElementName(video)
	//1、创建HYXMLParse对象，需要传入模型对象的类名(VideoModel) 和 XML 子节点的名 (video)
    HYXMLParser* parser = [[HYXMLParser alloc] initWithModelClassName:@"VideoModel" withElementName:@"video"];
    
    //NSData -> NSMutableArray of models
    NSMutableArray* models = [parser objectFromData:data];
	
	```

###The mdels is you want ,That OK!
