当我们向一个对象发送消息时，runtime会在这个对象所属的这个类的方法列表中查找方法，而向一个类发送消息时，会在这个类的meta-class的方法列表中查找。

meta-class很重要，是因为它存储着一个类的所有类方法，每个类都会有一个单独的meta-class，因为每个类的类方法基本不可能完全相同。

meta-class（元类）的isa指针指向基类的meta-class ,以此作为它们的所属类，即，任何NSObject继承体系下的meta-class都是用NSObject的meta-class作为自己的所属类，而基类的meta-class的isa指针指向自己。

我们在一个类对象调用class方法是无法获取meta-class，它只是返回类而已。

#Runtime中类与对象操作函数

类的操作方法大部分是以class_为前缀的，而对象的操作方法大部分是以objc_或object_为前缀的，

####类相关操作函数

 * 类名（name）
 
 //获取类的类名
 
 ```
 const char *class_getName(Class cls);//如果传入cls为Nil,则返回一个字符串。
 
 ```
 * 父类（super_class）和元类（meta_class）

//获取类的父类

```
Class class_getSuperclass(Class cls);//当cls为Nil或者cls为根类时 ，返回Nil.

```
//判断给定的Class是否是一个元类

```
BOOL class_isMetaClass(Class cls);//如过cls是元类，则返回YES;如果传入的cls为Nil ,则返回NO。

```
* 实例变量大小。（instance_size）

```
size_t class_getInstanceSize (Class cls);

```
* 成员变量（ivars）及属性

在objc_class中，所有的成员变量，属性的信息是放在链表ivars中的 ，ivars是一个数组，数组中每个元素是指向Ivar（变量信息）的指针。

```
1，成员变量操作函数。
//获取类中指定名称实例成员变量的信息。
Ivar class_getInstanceVariable(Class cls,const char *name);
//获取类成员变量的信息。？？？OC不支持类变量。
Ivar class_getClassVariable (Class cls,const char  *name);
//添加成员变量【只能在运行时创建一个类的时候调用这个函数给这个类添加成员变量。这个方法指只能在objc_allocateClassPair函数与objc_registerClassPair之间调用】
BOOL class_addIvar (Class cls, const char *name ,size_t size,uint8_t alignment,const char *types);
//获取整个成员变量列表
Ivar *class_copyInvarList(Class cls,unsigned int *outCount);
```
```
2，属性操作函数
//获取指定的属性
objc_property_t class_getProperty (Class cls,const char *name);
//获取属性列表
objc_property_t *class_copyPropertyList(Class cls,unsigned int *outCount);
//为类添加属性
BOOL class_addProperty(Class cls,const char *name,const objc_property_attribute_t *attributes, unsigned int attributeCount);
// 替换类的属性
void class_replaceProperty ( Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount );

```
```
3,方法（methodLists）
//添加方法
BOOL class_addMethod (Class cls,SEL name ,IMP imp ,const char *types);
//获取实例方法
Method class_getInstanceMethod (Class cls,SEL name);
//获取类方法
Method class_getClassMethod(Class cls,SEL name);
//获取所有方法的数组
Method *class_copyMethodList(Class cls,unsigned int *outCount);
//替代方法的实现
IMP class_replaceMethod(Class cls,SEL name,IMP imp ,const char *types);
//返回方法的具体实现
IMP class_getMethodImplementation(Class cls ,SEL name);
IMP class_getMethodImplementation_stret(Class cls,SEL name);
//类实例是否响应指定的selector ???
BOOL class_respondsToSelector(Class cls,SEL sel);

```
####协议（objc_protocol_list）

```
//添加协议
BOOL class_addProtocol(Class cls ,Protocol *protocol);
//返回类是否实现指定的协议
BOOL class_conformsToProtocol(Class cls,Protocol *protocol);//该函数可以使用NSObject类的conformsToProtocol:替代
//返回类实现的协议列表
Protocol *class_copyProtocolList(Class cls,unsinged int *outCount);

```
###版本（version）
```
//获取版本号
int class_getVersion(Class cls);
//设置版本号
void class_setVersion(Class cls,int version);
```
```


```



































